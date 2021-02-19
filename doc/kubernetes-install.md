### [Kubernetes](https://kubernetes.io/) installation guide

- Install `kubeadm`, `kubelet`, `kubectl` on master and nodes
	First, run `sudo -i` to enter by `root`
	- on Linux (Debian based)
	```bash
	apt-get update && apt-get install -y apt-transport-https curl
	curl -s [https://packages.cloud.google.com/apt/doc/apt-](https://packages.cloud.google.com/apt/doc/apt-)key.gpg | apt-key add -
	cat  <<EOF >/etc/apt/sources.list.d/kubernetes.list
	deb [https://apt.kubernetes.io/](https://apt.kubernetes.io/) kubernetes-xenial main
	EOF
	apt-get update
	apt-get install  -y kubelet kubeadm kubectl
	apt-mark hold kubelet kubeadm kubectl
  systemctl enable --now kubelet
	swapoff -a
	```

<br>

- master
	- Initialize `kubeadm`
	```bash
	kubeadm init --pod-network-cidr=10.244.0.0/16
	```
	```bash
	[init] Using Kubernetes version: vX.Y.Z
	[preflight] Running pre-flight checks
	[preflight] Pulling images required for setting up a Kubernetes cluster
	[preflight] This might take a minute or two, depending on the speed of your internet connection
	[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
	[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
	[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml" 
	[kubelet-start] Activating the kubelet service
	[certs] Using certificateDir folder "/etc/kubernetes/pki"
	[certs] Generating "etcd/ca" certificate and key
	[certs] Generating "etcd/server" certificate and key
	[certs] etcd/server serving cert is signed for DNS names [kubeadm-master localhost] and IPs [10.138.0.4 127.0.0.1 ::1]
	[certs] Generating "etcd/healthcheck-client" certificate and key
	[certs] Generating "etcd/peer" certificate and key
	[certs] etcd/peer serving cert is signed for DNS names [kubeadm-master localhost] and IPs [10.138.0.4 127.0.0.1 ::1]
	[certs] Generating "apiserver-etcd-client" certificate and key
	[certs] Generating "ca" certificate and key
	[certs] Generating "apiserver" certificate and key
	[certs] apiserver serving cert is signed for DNS names [kubeadm-master kubernetes kubernetes.default kubernetes.default.svc kubernetes.default.svc.cluster.local] and IPs [10.96.0.1 10.138.0.4]
	[certs] Generating "apiserver-kubelet-client" certificate and key
	[certs] Generating "front-proxy-ca" certificate and key
	[certs] Generating "front-proxy-client" certificate and key
	[certs] Generating "sa" key and public key
	[kubeconfig] Using kubeconfig folder "/etc/kubernetes"
	[kubeconfig] Writing "admin.conf" kubeconfig file
	[kubeconfig] Writing "kubelet.conf" kubeconfig file
	[kubeconfig] Writing "controller-manager.conf" kubeconfig file
	[kubeconfig] Writing "scheduler.conf" kubeconfig file
	[control-plane] Using manifest folder "/etc/kubernetes/manifests"
	[control-plane] Creating static Pod manifest for "kube-apiserver"
	[control-plane] Creating static Pod manifest for "kube-controller-manager"
	[control-plane] Creating static Pod manifest for "kube-scheduler"
	[etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
	[wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 4m0s
	[apiclient] All control plane components are healthy after 31.501735 seconds
	[uploadconfig] storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
	[kubelet] Creating a ConfigMap "kubelet-config-X.Y" in namespace kube-system with the configuration for the kubelets in the cluster
	[patchnode] Uploading the CRI Socket information "/var/run/dockershim.sock" to the Node API object "kubeadm-master" as an annotation
	[mark-control-plane] Marking the node kubeadm-master as control-plane by adding the label "[node-role.kubernetes.io/master=](http://node-role.kubernetes.io/master=)''"
	[mark-control-plane] Marking the node kubeadm-master as control-plane by adding the taints [node-role.kubernetes.io/master:NoSchedule]
	[bootstrap-token] Using token: <token>
	[bootstrap-token] Configuring bootstrap tokens, cluster-info ConfigMap, RBAC Roles
	[bootstraptoken] configured RBAC rules to allow Node Bootstrap tokens to post CSRs in order for nodes to get long term certificate credentials
	[bootstraptoken] configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a Node Bootstrap Token
	[bootstraptoken] configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
	[bootstraptoken] creating the "cluster-info" ConfigMap in the "kube-public" namespace
	[addons] Applied essential addon: CoreDNS
	[addons] Applied essential addon: kube-proxy
	Your Kubernetes master has initialized successfully!
	
	To start using your cluster, you need to run the following as a regular user:

		mkdir -p $HOME/.kube
		sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
		sudo chown $(id -u):$(id -g) $HOME/.kube/config

	You should now deploy a pod network to the cluster.
	Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
		/docs/concepts/cluster-administration/addons/
	
	You can now join any number of machines by running the following on each node as root:
		
		kubeadm join <master-ip>:<master-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>
	```
	- If you want to reset pod network option, run `kubeadm reset`

	- Copy config files to `~/.kube/`
	```bash
	$ mkdir  -p  $HOME/.kube
	$ sudo cp  -i /etc/kubernetes/admin.conf $HOME/.kube/config
	$ sudo chown  $(id  -u):$(id  -g)  $HOME/.kube/config
	```

	- Config pod network using `Calico` or `Flannel`
		- config with `Calico`
		```bash
		$ curl https://docs.projectcalico.org/manifests/canal.yaml -O
		$ kubectl apply -f canal.yaml
		```
		- config with `Flannel`
		```bash
		$ kubectl apply -f [https://raw.githubusercontent.com/coreos/flannel/62e44c867a2846fefb68bd5f178daf4da3095ccb/Documentation/kube-flannel.yml](https://raw.githubusercontent.com/coreos/flannel/62e44c867a2846fefb68bd5f178daf4da3095ccb/Documentation/kube-flannel.yml)
		```

<br>

- node
	```bash
	$ kubeadm join <master-ip>:<master-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>
	```

<br>

- Check node status
	```bash
	$ kubectl get nodes
	```
