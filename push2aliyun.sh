#!/bin/bash
version=v1.18.6
USER=
PASS=

docker login -u${USER} -p${PASS} registry.cn-shenzhen.aliyuncs.com
aliyun_registry=registry.cn-shenzhen.aliyuncs.com/sz-pub


push_to_aliyun(){
images=(`kubeadm config images list --kubernetes-version=$version|awk -F '/' '{print $2}'`)
for imagename in ${images[@]} ; do
     docker pull k8s.gcr.io/$imagename
     docker tag k8s.gcr.io/$imagename $aliyun_registry/$imagename
     docker push $aliyun_registry/$imagename
     docker rmi -f $url/$imagename
     done
}
push_to_aliyun
