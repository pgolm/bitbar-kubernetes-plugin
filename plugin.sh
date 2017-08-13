#!/bin/bash

# <bitbar.title>Kubernetes</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Peter Golm</bitbar.author>
# <bitbar.author.github>pgolm</bitbar.author.github>
# <bitbar.desc>Nagios info</bitbar.desc>
# <bitbar.dependencies>bash</bitbar.dependencies>

if [[ "$1" = "copy" ]]; then
  echo "$2" | pbcopy
  exit
fi

KUBERNETES_LOGO="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"

PATH=/usr/local/bin:$PATH
GET_ALL=$(kubectl get all --all-namespaces -o json)
GET_NODES=$(kubectl get nodes -o json)
KINDS=$(echo ${GET_ALL}|jq "[.items[].kind]|unique|sort|.[]"|tr -d '"')
NAMESPACES=$(echo ${GET_ALL}|jq "[.items[].metadata.namespace]|unique|sort|.[]"|tr -d '"')

function menuItem {
	echo "$1"
	ITEMS=$(echo ${GET_ALL}|jq ".items[]|select(.kind == \"$2\")|[.metadata.name]|sort|.[]"|tr -d '"')
	for item in $ITEMS; do
		echo "--$item"
		echo "----Copy|bash=$0 param1=copy param2=$item terminal=false"
		# echo "--Delete $item|alternate=true bash=kubectl"
	  # echo "--Delete|alternate=true bash=kubectl param1=delete param2=pod param3=$item"
	  # echo "----Describe|bash=kubectl param1=describe param2='--namespace=loadbalancer' param3=pod/$item"
	  # echo "----Logs|bash=kubectl param1=logs param2=-f param3=pod/$item"
	done
}

echo "|image=$KUBERNETES_LOGO"
echo "---"
echo "Namespaces"
for namespace in $NAMESPACES; do
	echo "--$namespace"
done
echo "Nodes"
for node in $(echo ${GET_NODES}| jq ".items[]|[.metadata.name]|sort|.[]"|tr -d '"'); do
  echo "--$node"
done

echo "---"
menuItem "Deployments" "Deployment"
menuItem "ReplicaSets" "ReplicaSet"
menuItem "Replication Controllers" "Replication Controller"
menuItem "Daemon Sets" "Daemon Set"
menuItem "Stateful Sets" "Stateful Set"
menuItem "Jobs" "Job"
menuItem "Pods" "Pod"

echo "---"
menuItem "Ingresses" "Ingress"
menuItem "Services" "Service"

echo "---"
echo "🔄 Refresh|refresh=true"
