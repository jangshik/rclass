#### 1. 기본 네트워크 ####
#### __ 1) 패키지 준비 ####
# install.packages("intergraph")
# install.packages("igraph")
library("igraph")

#### __ 2) 무향 네트워크 생성 ####
# 방법 1
# sample_g = graph(edges = c(1, 2, 2, 3, 3, 1), n = 3, directed = FALSE) 
sample_g = graph(edges = c(1, 2, 
                           2, 3, 
                           3, 1), 
                 n = 3, directed = FALSE) 
sample_g
plot(sample_g)

# 방법 2
df = data.frame(from = c(1, 2, 3),
                to   = c(2, 3, 1))

edges = unlist(df)

sample_g = graph(edges = edges,
                 n = 3, directed = FALSE) 
sample_g
plot(sample_g)

#### __ 3) 유향 네트워크 생성 ####
# 방법 1
sample_g = graph(edges = c(1, 2, 
                           2, 3, 
                           3, 1), 
                 n = 3, directed = TRUE) 
sample_g
plot(sample_g)


# 방법 2
df = data.frame(from = c(1, 2, 3),
                to   = c(2, 3, 1))
edges = matrix(unlist(df), nrow = 2, byrow = TRUE)
edges = as.vector(edges)

sample_g = graph(edges = edges,
                 n = 3, directed = TRUE) 
sample_g
plot(sample_g)

sample_ggn = ggnetwork(sample_g)
ggplot(data = sample_ggn,
       aes(x = x, 
           y = y, 
           xend = xend, 
           yend = yend)) +
  geom_edges(arrow = arrow(length = unit(1, "lines"), type = "closed")) +
  geom_nodes(size = 7) + 
  geom_nodetext(aes(label = vertex.names), 
                color = "#FFFFFF",
                fontface = "bold") +
  theme_bw()


#### 2. 임의의 네트워크 생성 ####
#### __ 1) 패키지 준비 ####
library("ggnetwork")
library("network")
library("sna")

#### __ 2) 데이터 준비 ####
n_size = 8

# 방법 1
set.seed(1)
mat_net = rgraph(n_size, tprob = 0.2)
# colnames(mat_net) = LETTERS[1:n_size]
# rownames(mat_net) = LETTERS[1:n_size]
mat_net

# 방법 2
set.seed(1)
df = data.frame(from  = sample(1:15, size = 88, replace = TRUE),
                to    = sample(1:15, size = 88, replace = TRUE),
                value = 1)

library("reshape2")
df_cast = acast(df, from ~ to, fun.aggregate = function(x){ifelse(length(x) >= 1, 1, 0)})
df_cast

mat_net = as.matrix(df_cast)

#### __ 3) 네트워크 생성 ####
n = network(mat_net, directed = FALSE)
n %v% "family" = sample(letters[1:3], size = n_size, replace = TRUE)
n %v% "importance" = sample(1:3, size = n_size, replace = TRUE)
edges = network.edgecount(n)

# network 패키지의 함수!!
set.edge.attribute(x = n, attrname = "type", 
                   value = sample(letters[24:26], edges, replace = TRUE))
set.edge.attribute(x = n, attrname = "day", 
                   value = sample(1:3, edges, replace = TRUE))

# set.vertex.attribute()

#### __ 4) 네트워크 속성 확인 ####
# 네트워크 크기
network.size(n)

# 네트워크 attribute 확인
names(n$mel[[1]]$atl)[-1]

# 네트워크의 특정 attribute에 할당된 값 추출
get.edge.attribute(n, attrname = "type")

# 특정 node에 연결된 node 정보를 추출하시오.
get.edgeIDs(x = n, v = 2)
get.edges(x = n, v = 3)

edge_info = get.edges(x = n, v = 3)

df_edge_info = data.frame(e_in  = unlist(lapply(edge_info, FUN = "[", 1)),
                          e_out = unlist(lapply(edge_info, FUN = "[", 2)))

df_edge_info = data.frame(e_in  = unlist(lapply(edge_info, FUN = "[", 1)),
                          e_out = unlist(lapply(edge_info, FUN = "[", 2)),
                          type  = unlist(lapply(lapply(edge_info, FUN = function(x){lapply(X = `[`(x)$atl, FUN = "[")}), "[", 1)),
                          day   = unlist(lapply(lapply(edge_info, FUN = function(x){lapply(X = `[`(x)$atl, FUN = "[")}), "[", 1)))

degree(n)
degree(n, cmode = "outdegree")
degree(n, cmode = "indegree")



#### __ 5) 네트워크 그리기 ####
gg_net = ggnetwork(n)
ggplot(data = gg_net,
       aes(x = x, 
           y = y, 
           xend = xend, 
           yend = yend)) +
  geom_edges(aes(linetype = type), size = 1) +
  theme_blank()

ggplot(data = gg_net,
       aes(x = x, 
           y = y, 
           xend = xend, 
           yend = yend)) +
  geom_edges(aes(linetype = type), size = 1) +
  geom_nodes(size = 7, color = "#000000") +
  theme_blank()

ggplot(data = gg_net,
       aes(x = x, 
           y = y, 
           xend = xend, 
           yend = yend)) +
  geom_edges(aes(linetype = type), size = 1) +
  geom_nodes(size = 7, color = "#000000") + 
  geom_nodes(size = 6, color = "#FFFFFF") + 
  geom_nodetext(aes(label = vertex.names)) +
  theme_blank()

#### 다양한 네트워크 ####
#### __ 1) 비어있는 그래프 ####
ng = make_empty_graph(40)
plot(ng)

#### __ 2) 완전 연결 그래프 ####
ng = make_full_graph(40)
plot(ng)

#### __ 3) 트리 그래프 ####
ng = make_tree(40)
plot(ng)

#### __ 4) 고리 그래프 ####
ng = make_ring(40)
plot(ng)

#### __ 5) Erdos-Renyi 그래프 ####
ng = sample_gnm(n = 100, m = 50)
plot(ng)

plot(ng, vertex.size = 6, vertex.label = NA)


#### 3. 연습 문제 ####
#### __ 1) ####
# 이름이 A, B, C, D인 4개의 node가 존재할 때
# 각 node끼리 순환연결이 되는 네트워크를 생성하시오.
# 단, 방향은 없는 것으로 한다(무향 그래프).
# 해당 네트워크를 그래프로 그려 확인하시오.
library("igraph")
sample_g = graph(edges = c("A", "B", 
                           "B", "C", 
                           "C", "D",
                           "D", "A"), directed = FALSE) 
sample_g
plot(sample_g)


#### __ 2) ####
# 문제 1번에서 생성한 네트워크의 코드를 활용하시오.
# A node에 순환경로가 생성되도록 node E를 추가하시오.

# 방법 1
sample_g = graph(edges = c("A", "B", 
                           "B", "C", 
                           "C", "D",
                           "D", "A",
                           "E", "A", 
                           "A", "E"), directed = FALSE) 
sample_g
plot(sample_g)

# 방법 2
sample_g = graph(edges = c("A", "B", 
                           "B", "C", 
                           "C", "D",
                           "D", "A"), directed = FALSE) 

sample_g = add.vertices(graph = sample_g, nv = 1)
plot(sample_g)

get.vertex.attribute(sample_g)

sample_g = set_vertex_attr(graph = sample_g, name = "name", value = c(LETTERS[1:4], "E"))
plot(sample_g)

sample_g = add.edges(graph = sample_g, edges = c("A", "E", "E", "A"))
plot(sample_g)

#### __ 3) ####
# 이름이 A, B, C, D인 4개의 node가 존재할 때
# 각 node끼리 순환연결이 되는 네트워크를 생성하시오.
# 단, 방향은 임의로 지정한다(유향 그래프).
sample_g = graph(edges = c("A", "B", 
                           "B", "C", 
                           "C", "D",
                           "D", "A"), directed = TRUE) 
plot(sample_g)

#### __ 4) ####
# 문제 3번에서 작성한 코드를 참고하시오.
# 문제 3번에서 만든 네트워크와 방향이 반대인 유향 그래프를 생성하시오.

# 방법 1
sample_g = graph(edges = c("B", "A", 
                           "C", "B", 
                           "D", "C",
                           "A", "D"), directed = TRUE) 
plot(sample_g)

# 방법 2
edges = rev(c("A", "B", 
              "B", "C", 
              "C", "D",
              "D", "A"))
sample_g = graph(edges = edges, directed = TRUE) 
plot(sample_g)


#### __ 5) ####
# 크기가 30인 임의의 무향 그래프를 생성하시오. (tprob = 0.1)
# edge의 "join" attribute에 14부터 17까지 단순 임의 복원추출을 사용하여 값을 지정하시오.
# 단, set.seed(1)로 지정하여 연산을 수행하시오.
set.seed(1)
mat_net = network(rgraph(30, tprob = 0.1), directed = FALSE)
network::set.vertex.attribute(x = mat_net, attrname = "join",
                              value = sample(14:17, replace = TRUE,
                                             size = network.edgecount(mat_net)))
plot(mat_net)

gg_net = ggnetwork(mat_net)
ggplot(data = gg_net,
       aes(x = x, 
           y = y, 
           xend = xend, 
           yend = yend)) +
  geom_edges(size = 1) +
  geom_nodes(aes(color = as.factor(join)), size = 8) +
  theme_blank() + 
  labs(color = "Join")


#### __ 6) ####
# 문제 5에서 생성한 네트워크에서 각종 정보를 추출하시오.
#  - 네트워크 크기
#  - "join" attribute의 값을 모두 추출하시오.
#  - 인접 node와 연결이 가장 많이 되어있는 node를 추출하시오.
network.size(mat_net)
str(mat_net)
unique(unlist(lapply(mat_net$val, "[[", 3)))