<h2 class="code-line" data-line-start=0 data-line-end=1 ><a id="____151___0"></a>Домашнее задание к занятию “15.1. Организация сети”</h2>
<p class="has-line-data" data-line-start="2" data-line-end="4">Создаем с помощью terraform требуемую инфраструктуру<br>
Файлы  terraform в текущем репозитории</p>
<p class="has-line-data" data-line-start="6" data-line-end="8">Список VM<br>
yc compute instance list</p>
<pre><code>+----------------------+---------------------+---------------+---------+---------------+----------------+
|          ID          |        NAME         |    ZONE ID    | STATUS  |  EXTERNAL IP  |  INTERNAL IP   |
+----------------------+---------------------+---------------+---------+---------------+----------------+
| fhm585j3hqsaaaam4mc6 | netology-vm-private | ru-central1-a | RUNNING |               | 192.168.20.28  |
| fhmev282cek87t41van1 | netology-nat        | ru-central1-a | RUNNING | 51.250.94.69  | 192.168.10.254 |
| fhmq227o7qfso4gj7soh | netology-vm-public  | ru-central1-a | RUNNING | 51.250.88.225 | 192.168.10.30  |
+----------------------+---------------------+---------------+---------+---------------+----------------+
</code></pre>
<p class="has-line-data" data-line-start="16" data-line-end="17">Список подсетей</p>
<pre><code>yc vpc subnet list
+----------------------+-----------------------+----------------------+----------------------+---------------+-------------------+
|          ID          |         NAME          |      NETWORK ID      |    ROUTE TABLE ID    |     ZONE      |       RANGE       |
+----------------------+-----------------------+----------------------+----------------------+---------------+-------------------+
| b0cufmgsod05rafe6hae | default-ru-central1-c | enpikviuoer869slnc7p |                      | ru-central1-c | [10.130.0.0/24]   |
| e2lm7vecbak1m0d14o8s | default-ru-central1-b | enpikviuoer869slnc7p |                      | ru-central1-b | [10.129.0.0/24]   |
| e9b66lrf1jlbta3hjgkb | default-ru-central1-a | enpikviuoer869slnc7p |                      | ru-central1-a | [10.128.0.0/24]   |
| e9b8e00buo6tqmvu4vim | netology-tf-private   | enp3rgpiqom0qf9nrk0v | enppvec5s00h0kfh9dqr | ru-central1-a | [192.168.20.0/24] |
| e9bu9fj59r30qfdet0n1 | netology-tf-public    | enp3rgpiqom0qf9nrk0v |                      | ru-central1-a | [192.168.10.0/24] |
+----------------------+-----------------------+----------------------+----------------------+---------------+-------------------+
</code></pre>
<p class="has-line-data" data-line-start="28" data-line-end="29">Список сетей</p>
<pre><code>yc vpc network list
+----------------------+-------------+
|          ID          |    NAME     |
+----------------------+-------------+
| enp3rgpiqom0qf9nrk0v | netology-tf |
| enpikviuoer869slnc7p | default     |
+----------------------+-------------+
</code></pre>
<p class="has-line-data" data-line-start="37" data-line-end="38">Список таблиц маршутизации</p>
<pre><code>yc vpc route-table list
+----------------------+-------------+-------------+----------------------+
|          ID          |    NAME     | DESCRIPTION |      NETWORK-ID      |
+----------------------+-------------+-------------+----------------------+
| enppvec5s00h0kfh9dqr | netology-rt |             | enp3rgpiqom0qf9nrk0v |
+----------------------+-------------+-------------+----------------------+
</code></pre>
<p class="has-line-data" data-line-start="46" data-line-end="47">Подключаемся к netology-vm-public</p>
<pre><code>buntu@fhmq227o7qfso4gj7soh:~$ ping www.ru
PING www.ru (31.177.76.70) 56(84) bytes of data.
64 bytes from shop.parking.nic.ru (31.177.76.70): icmp_seq=1 ttl=59 time=5.58 ms
64 bytes from shop.parking.nic.ru (31.177.76.70): icmp_seq=2 ttl=59 time=5.21 ms
</code></pre>
<p class="has-line-data" data-line-start="53" data-line-end="54">Подключаемся netology-vm-private</p>
<pre><code>ubuntu@fhmq227o7qfso4gj7soh:~$ sudo ssh -i ~/.ssh/id_rsa ubuntu@192.168.20.28
load pubkey &quot;/home/ubuntu/.ssh/id_rsa&quot;: invalid format
Welcome to Ubuntu 20.04.4 LTS (GNU/Linux 5.4.0-107-generic x86_64)
ubuntu@fhm585j3hqsaaaam4mc6:~$ ping www.ru
PING www.ru (31.177.80.70) 56(84) bytes of data.
64 bytes from shop.parking.nic.ru (31.177.80.70): icmp_seq=1 ttl=57 time=7.35 ms
</code></pre>
<h2 class="code-line" data-line-start=62 data-line-end=63 ><a id="______62"></a>Вывод результат достигнут. Удаляем из облака</h2>
<p class="has-line-data" data-line-start="63" data-line-end="71">mike@HOMEDX79SR:~/tf$ ./terraform destroy<br>
yandex_vpc_network.netology-network-tf: Refreshing state… [id=enp3rgpiqom0qf9nrk0v]<br>
yandex_vpc_subnet.public: Refreshing state… [id=e9bu9fj59r30qfdet0n1]<br>
yandex_vpc_route_table.netology-rt: Refreshing state… [id=enppvec5s00h0kfh9dqr]<br>
yandex_vpc_subnet.private: Refreshing state… [id=e9b8e00buo6tqmvu4vim]<br>
yandex_compute_instance.netology-vm-public: Refreshing state… [id=fhmq227o7qfso4gj7soh]<br>
yandex_compute_instance.netology-nat: Refreshing state… [id=fhmev282cek87t41van1]<br>
yandex_compute_instance.netology-vm-private: Refreshing state… [id=fhm585j3hqsaaaam4mc6]</p>
<p class="has-line-data" data-line-start="72" data-line-end="74">Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the<br>
following symbols:</p>
<ul>
<li class="has-line-data" data-line-start="74" data-line-end="76">destroy</li>
</ul>
<p class="has-line-data" data-line-start="76" data-line-end="77">Terraform will perform the following actions:</p>
<h1 class="code-line" data-line-start=78 data-line-end=79 ><a id="yandex_compute_instancenetologynat_will_be_destroyed_78"></a>yandex_compute_instance.netology-nat will be destroyed</h1>
<ul>
<li class="has-line-data" data-line-start="79" data-line-end="140">resource “yandex_compute_instance” “netology-nat” {
<ul>
<li class="has-line-data" data-line-start="80" data-line-end="81">
<p class="has-line-data" data-line-start="80" data-line-end="81">created_at                = “2022-06-05T18:23:33Z” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="81" data-line-end="82">
<p class="has-line-data" data-line-start="81" data-line-end="82">folder_id                 = “b1gmg4vd0g5i14e03de0” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="82" data-line-end="83">
<p class="has-line-data" data-line-start="82" data-line-end="83">fqdn                      = “fhmev282cek87t41van1.auto.internal” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="83" data-line-end="84">
<p class="has-line-data" data-line-start="83" data-line-end="84">hostname                  = “fhmev282cek87t41van1” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="84" data-line-end="85">
<p class="has-line-data" data-line-start="84" data-line-end="85">id                        = “fhmev282cek87t41van1” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="85" data-line-end="86">
<p class="has-line-data" data-line-start="85" data-line-end="86">labels                    = {} -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="86" data-line-end="91">
<p class="has-line-data" data-line-start="86" data-line-end="87">metadata                  = {</p>
<ul>
<li class="has-line-data" data-line-start="87" data-line-end="91">“ssh-keys” = &lt;&lt;-EOT<br>
myuser:ssh-rsa<br>
EOT<br>
} -&gt; null</li>
</ul>
</li>
<li class="has-line-data" data-line-start="91" data-line-end="92">
<p class="has-line-data" data-line-start="91" data-line-end="92">name                      = “netology-nat” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="92" data-line-end="93">
<p class="has-line-data" data-line-start="92" data-line-end="93">network_acceleration_type = “standard” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="93" data-line-end="94">
<p class="has-line-data" data-line-start="93" data-line-end="94">platform_id               = “standard-v1” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="94" data-line-end="95">
<p class="has-line-data" data-line-start="94" data-line-end="95">status                    = “running” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="95" data-line-end="97">
<p class="has-line-data" data-line-start="95" data-line-end="96">zone                      = “ru-central1-a” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="97" data-line-end="111">
<p class="has-line-data" data-line-start="97" data-line-end="98">boot_disk {</p>
<ul>
<li class="has-line-data" data-line-start="98" data-line-end="99">
<p class="has-line-data" data-line-start="98" data-line-end="99">auto_delete = true -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="99" data-line-end="100">
<p class="has-line-data" data-line-start="99" data-line-end="100">device_name = “fhmb6pu351dnad6vbsuj” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="100" data-line-end="101">
<p class="has-line-data" data-line-start="100" data-line-end="101">disk_id     = “fhmb6pu351dnad6vbsuj” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="101" data-line-end="103">
<p class="has-line-data" data-line-start="101" data-line-end="102">mode        = “READ_WRITE” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="103" data-line-end="111">
<p class="has-line-data" data-line-start="103" data-line-end="104">initialize_params {</p>
<ul>
<li class="has-line-data" data-line-start="104" data-line-end="105">block_size = 4096 -&gt; null</li>
<li class="has-line-data" data-line-start="105" data-line-end="106">image_id   = “fd80mrhj8fl2oe87o4e1” -&gt; null</li>
<li class="has-line-data" data-line-start="106" data-line-end="107">size       = 3 -&gt; null</li>
<li class="has-line-data" data-line-start="107" data-line-end="111">type       = “network-hdd” -&gt; null<br>
}<br>
}</li>
</ul>
</li>
</ul>
</li>
<li class="has-line-data" data-line-start="111" data-line-end="124">
<p class="has-line-data" data-line-start="111" data-line-end="112">network_interface {</p>
<ul>
<li class="has-line-data" data-line-start="112" data-line-end="113">index              = 0 -&gt; null</li>
<li class="has-line-data" data-line-start="113" data-line-end="114">ip_address         = “192.168.10.254” -&gt; null</li>
<li class="has-line-data" data-line-start="114" data-line-end="115">ipv4               = true -&gt; null</li>
<li class="has-line-data" data-line-start="115" data-line-end="116">ipv6               = false -&gt; null</li>
<li class="has-line-data" data-line-start="116" data-line-end="117">mac_address        = “d0:0d:ef:89:02:63” -&gt; null</li>
<li class="has-line-data" data-line-start="117" data-line-end="118">nat                = true -&gt; null</li>
<li class="has-line-data" data-line-start="118" data-line-end="119">nat_ip_address     = “51.250.94.69” -&gt; null</li>
<li class="has-line-data" data-line-start="119" data-line-end="120">nat_ip_version     = “IPV4” -&gt; null</li>
<li class="has-line-data" data-line-start="120" data-line-end="121">security_group_ids = [] -&gt; null</li>
<li class="has-line-data" data-line-start="121" data-line-end="124">subnet_id          = “e9bu9fj59r30qfdet0n1” -&gt; null<br>
}</li>
</ul>
</li>
<li class="has-line-data" data-line-start="124" data-line-end="128">
<p class="has-line-data" data-line-start="124" data-line-end="125">placement_policy {</p>
<ul>
<li class="has-line-data" data-line-start="125" data-line-end="128">host_affinity_rules = [] -&gt; null<br>
}</li>
</ul>
</li>
<li class="has-line-data" data-line-start="128" data-line-end="135">
<p class="has-line-data" data-line-start="128" data-line-end="129">resources {</p>
<ul>
<li class="has-line-data" data-line-start="129" data-line-end="130">core_fraction = 100 -&gt; null</li>
<li class="has-line-data" data-line-start="130" data-line-end="131">cores         = 2 -&gt; null</li>
<li class="has-line-data" data-line-start="131" data-line-end="132">gpus          = 0 -&gt; null</li>
<li class="has-line-data" data-line-start="132" data-line-end="135">memory        = 4 -&gt; null<br>
}</li>
</ul>
</li>
<li class="has-line-data" data-line-start="135" data-line-end="140">
<p class="has-line-data" data-line-start="135" data-line-end="136">scheduling_policy {</p>
<ul>
<li class="has-line-data" data-line-start="136" data-line-end="140">preemptible = false -&gt; null<br>
}<br>
}</li>
</ul>
</li>
</ul>
</li>
</ul>
<h1 class="code-line" data-line-start=140 data-line-end=141 ><a id="yandex_compute_instancenetologyvmprivate_will_be_destroyed_140"></a>yandex_compute_instance.netology-vm-private will be destroyed</h1>
<ul>
<li class="has-line-data" data-line-start="141" data-line-end="200">resource “yandex_compute_instance” “netology-vm-private” {
<ul>
<li class="has-line-data" data-line-start="142" data-line-end="143">
<p class="has-line-data" data-line-start="142" data-line-end="143">created_at                = “2022-06-05T18:25:06Z” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="143" data-line-end="144">
<p class="has-line-data" data-line-start="143" data-line-end="144">folder_id                 = “b1gmg4vd0g5i14e03de0” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="144" data-line-end="145">
<p class="has-line-data" data-line-start="144" data-line-end="145">fqdn                      = “fhm585j3hqsaaaam4mc6.auto.internal” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="145" data-line-end="146">
<p class="has-line-data" data-line-start="145" data-line-end="146">hostname                  = “fhm585j3hqsaaaam4mc6” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="146" data-line-end="147">
<p class="has-line-data" data-line-start="146" data-line-end="147">id                        = “fhm585j3hqsaaaam4mc6” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="147" data-line-end="148">
<p class="has-line-data" data-line-start="147" data-line-end="148">labels                    = {} -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="148" data-line-end="153">
<p class="has-line-data" data-line-start="148" data-line-end="149">metadata                  = {</p>
<ul>
<li class="has-line-data" data-line-start="149" data-line-end="153">“ssh-keys” = &lt;&lt;-EOT<br>
myuser:ssh-rsa<br>
EOT<br>
} -&gt; null</li>
</ul>
</li>
<li class="has-line-data" data-line-start="153" data-line-end="154">
<p class="has-line-data" data-line-start="153" data-line-end="154">name                      = “netology-vm-private” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="154" data-line-end="155">
<p class="has-line-data" data-line-start="154" data-line-end="155">network_acceleration_type = “standard” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="155" data-line-end="156">
<p class="has-line-data" data-line-start="155" data-line-end="156">platform_id               = “standard-v1” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="156" data-line-end="157">
<p class="has-line-data" data-line-start="156" data-line-end="157">status                    = “running” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="157" data-line-end="159">
<p class="has-line-data" data-line-start="157" data-line-end="158">zone                      = “ru-central1-a” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="159" data-line-end="173">
<p class="has-line-data" data-line-start="159" data-line-end="160">boot_disk {</p>
<ul>
<li class="has-line-data" data-line-start="160" data-line-end="161">
<p class="has-line-data" data-line-start="160" data-line-end="161">auto_delete = true -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="161" data-line-end="162">
<p class="has-line-data" data-line-start="161" data-line-end="162">device_name = “fhmq0lrhoriqjtd7dvc1” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="162" data-line-end="163">
<p class="has-line-data" data-line-start="162" data-line-end="163">disk_id     = “fhmq0lrhoriqjtd7dvc1” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="163" data-line-end="165">
<p class="has-line-data" data-line-start="163" data-line-end="164">mode        = “READ_WRITE” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="165" data-line-end="173">
<p class="has-line-data" data-line-start="165" data-line-end="166">initialize_params {</p>
<ul>
<li class="has-line-data" data-line-start="166" data-line-end="167">block_size = 4096 -&gt; null</li>
<li class="has-line-data" data-line-start="167" data-line-end="168">image_id   = “fd8anitv6eua45627i0e” -&gt; null</li>
<li class="has-line-data" data-line-start="168" data-line-end="169">size       = 5 -&gt; null</li>
<li class="has-line-data" data-line-start="169" data-line-end="173">type       = “network-hdd” -&gt; null<br>
}<br>
}</li>
</ul>
</li>
</ul>
</li>
<li class="has-line-data" data-line-start="173" data-line-end="184">
<p class="has-line-data" data-line-start="173" data-line-end="174">network_interface {</p>
<ul>
<li class="has-line-data" data-line-start="174" data-line-end="175">index              = 0 -&gt; null</li>
<li class="has-line-data" data-line-start="175" data-line-end="176">ip_address         = “192.168.20.28” -&gt; null</li>
<li class="has-line-data" data-line-start="176" data-line-end="177">ipv4               = true -&gt; null</li>
<li class="has-line-data" data-line-start="177" data-line-end="178">ipv6               = false -&gt; null</li>
<li class="has-line-data" data-line-start="178" data-line-end="179">mac_address        = “d0:0d:54:16:63:8e” -&gt; null</li>
<li class="has-line-data" data-line-start="179" data-line-end="180">nat                = false -&gt; null</li>
<li class="has-line-data" data-line-start="180" data-line-end="181">security_group_ids = [] -&gt; null</li>
<li class="has-line-data" data-line-start="181" data-line-end="184">subnet_id          = “e9b8e00buo6tqmvu4vim” -&gt; null<br>
}</li>
</ul>
</li>
<li class="has-line-data" data-line-start="184" data-line-end="188">
<p class="has-line-data" data-line-start="184" data-line-end="185">placement_policy {</p>
<ul>
<li class="has-line-data" data-line-start="185" data-line-end="188">host_affinity_rules = [] -&gt; null<br>
}</li>
</ul>
</li>
<li class="has-line-data" data-line-start="188" data-line-end="195">
<p class="has-line-data" data-line-start="188" data-line-end="189">resources {</p>
<ul>
<li class="has-line-data" data-line-start="189" data-line-end="190">core_fraction = 100 -&gt; null</li>
<li class="has-line-data" data-line-start="190" data-line-end="191">cores         = 2 -&gt; null</li>
<li class="has-line-data" data-line-start="191" data-line-end="192">gpus          = 0 -&gt; null</li>
<li class="has-line-data" data-line-start="192" data-line-end="195">memory        = 4 -&gt; null<br>
}</li>
</ul>
</li>
<li class="has-line-data" data-line-start="195" data-line-end="200">
<p class="has-line-data" data-line-start="195" data-line-end="196">scheduling_policy {</p>
<ul>
<li class="has-line-data" data-line-start="196" data-line-end="200">preemptible = false -&gt; null<br>
}<br>
}</li>
</ul>
</li>
</ul>
</li>
</ul>
<h1 class="code-line" data-line-start=200 data-line-end=201 ><a id="yandex_compute_instancenetologyvmpublic_will_be_destroyed_200"></a>yandex_compute_instance.netology-vm-public will be destroyed</h1>
<ul>
<li class="has-line-data" data-line-start="201" data-line-end="262">resource “yandex_compute_instance” “netology-vm-public” {
<ul>
<li class="has-line-data" data-line-start="202" data-line-end="203">
<p class="has-line-data" data-line-start="202" data-line-end="203">created_at                = “2022-06-05T18:23:33Z” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="203" data-line-end="204">
<p class="has-line-data" data-line-start="203" data-line-end="204">folder_id                 = “b1gmg4vd0g5i14e03de0” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="204" data-line-end="205">
<p class="has-line-data" data-line-start="204" data-line-end="205">fqdn                      = “fhmq227o7qfso4gj7soh.auto.internal” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="205" data-line-end="206">
<p class="has-line-data" data-line-start="205" data-line-end="206">hostname                  = “fhmq227o7qfso4gj7soh” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="206" data-line-end="207">
<p class="has-line-data" data-line-start="206" data-line-end="207">id                        = “fhmq227o7qfso4gj7soh” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="207" data-line-end="208">
<p class="has-line-data" data-line-start="207" data-line-end="208">labels                    = {} -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="208" data-line-end="213">
<p class="has-line-data" data-line-start="208" data-line-end="209">metadata                  = {</p>
<ul>
<li class="has-line-data" data-line-start="209" data-line-end="213">“ssh-keys” = &lt;&lt;-EOT<br>
myuser:ssh-rsa<br>
EOT<br>
} -&gt; null</li>
</ul>
</li>
<li class="has-line-data" data-line-start="213" data-line-end="214">
<p class="has-line-data" data-line-start="213" data-line-end="214">name                      = “netology-vm-public” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="214" data-line-end="215">
<p class="has-line-data" data-line-start="214" data-line-end="215">network_acceleration_type = “standard” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="215" data-line-end="216">
<p class="has-line-data" data-line-start="215" data-line-end="216">platform_id               = “standard-v1” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="216" data-line-end="217">
<p class="has-line-data" data-line-start="216" data-line-end="217">status                    = “running” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="217" data-line-end="219">
<p class="has-line-data" data-line-start="217" data-line-end="218">zone                      = “ru-central1-a” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="219" data-line-end="233">
<p class="has-line-data" data-line-start="219" data-line-end="220">boot_disk {</p>
<ul>
<li class="has-line-data" data-line-start="220" data-line-end="221">
<p class="has-line-data" data-line-start="220" data-line-end="221">auto_delete = true -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="221" data-line-end="222">
<p class="has-line-data" data-line-start="221" data-line-end="222">device_name = “fhmtmrd46i13d62ipibq” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="222" data-line-end="223">
<p class="has-line-data" data-line-start="222" data-line-end="223">disk_id     = “fhmtmrd46i13d62ipibq” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="223" data-line-end="225">
<p class="has-line-data" data-line-start="223" data-line-end="224">mode        = “READ_WRITE” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="225" data-line-end="233">
<p class="has-line-data" data-line-start="225" data-line-end="226">initialize_params {</p>
<ul>
<li class="has-line-data" data-line-start="226" data-line-end="227">block_size = 4096 -&gt; null</li>
<li class="has-line-data" data-line-start="227" data-line-end="228">image_id   = “fd8anitv6eua45627i0e” -&gt; null</li>
<li class="has-line-data" data-line-start="228" data-line-end="229">size       = 5 -&gt; null</li>
<li class="has-line-data" data-line-start="229" data-line-end="233">type       = “network-hdd” -&gt; null<br>
}<br>
}</li>
</ul>
</li>
</ul>
</li>
<li class="has-line-data" data-line-start="233" data-line-end="246">
<p class="has-line-data" data-line-start="233" data-line-end="234">network_interface {</p>
<ul>
<li class="has-line-data" data-line-start="234" data-line-end="235">index              = 0 -&gt; null</li>
<li class="has-line-data" data-line-start="235" data-line-end="236">ip_address         = “192.168.10.30” -&gt; null</li>
<li class="has-line-data" data-line-start="236" data-line-end="237">ipv4               = true -&gt; null</li>
<li class="has-line-data" data-line-start="237" data-line-end="238">ipv6               = false -&gt; null</li>
<li class="has-line-data" data-line-start="238" data-line-end="239">mac_address        = “d0:0d:1a:10:8f:83” -&gt; null</li>
<li class="has-line-data" data-line-start="239" data-line-end="240">nat                = true -&gt; null</li>
<li class="has-line-data" data-line-start="240" data-line-end="241">nat_ip_address     = “51.250.88.225” -&gt; null</li>
<li class="has-line-data" data-line-start="241" data-line-end="242">nat_ip_version     = “IPV4” -&gt; null</li>
<li class="has-line-data" data-line-start="242" data-line-end="243">security_group_ids = [] -&gt; null</li>
<li class="has-line-data" data-line-start="243" data-line-end="246">subnet_id          = “e9bu9fj59r30qfdet0n1” -&gt; null<br>
}</li>
</ul>
</li>
<li class="has-line-data" data-line-start="246" data-line-end="250">
<p class="has-line-data" data-line-start="246" data-line-end="247">placement_policy {</p>
<ul>
<li class="has-line-data" data-line-start="247" data-line-end="250">host_affinity_rules = [] -&gt; null<br>
}</li>
</ul>
</li>
<li class="has-line-data" data-line-start="250" data-line-end="257">
<p class="has-line-data" data-line-start="250" data-line-end="251">resources {</p>
<ul>
<li class="has-line-data" data-line-start="251" data-line-end="252">core_fraction = 100 -&gt; null</li>
<li class="has-line-data" data-line-start="252" data-line-end="253">cores         = 2 -&gt; null</li>
<li class="has-line-data" data-line-start="253" data-line-end="254">gpus          = 0 -&gt; null</li>
<li class="has-line-data" data-line-start="254" data-line-end="257">memory        = 4 -&gt; null<br>
}</li>
</ul>
</li>
<li class="has-line-data" data-line-start="257" data-line-end="262">
<p class="has-line-data" data-line-start="257" data-line-end="258">scheduling_policy {</p>
<ul>
<li class="has-line-data" data-line-start="258" data-line-end="262">preemptible = false -&gt; null<br>
}<br>
}</li>
</ul>
</li>
</ul>
</li>
</ul>
<h1 class="code-line" data-line-start=262 data-line-end=263 ><a id="yandex_vpc_networknetologynetworktf_will_be_destroyed_262"></a>yandex_vpc_network.netology-network-tf will be destroyed</h1>
<ul>
<li class="has-line-data" data-line-start="263" data-line-end="275">resource “yandex_vpc_network” “netology-network-tf” {
<ul>
<li class="has-line-data" data-line-start="264" data-line-end="265">created_at = “2022-06-05T13:28:21Z” -&gt; null</li>
<li class="has-line-data" data-line-start="265" data-line-end="266">folder_id  = “b1gmg4vd0g5i14e03de0” -&gt; null</li>
<li class="has-line-data" data-line-start="266" data-line-end="267">id         = “enp3rgpiqom0qf9nrk0v” -&gt; null</li>
<li class="has-line-data" data-line-start="267" data-line-end="268">labels     = {} -&gt; null</li>
<li class="has-line-data" data-line-start="268" data-line-end="269">name       = “netology-tf” -&gt; null</li>
<li class="has-line-data" data-line-start="269" data-line-end="275">subnet_ids = [
<ul>
<li class="has-line-data" data-line-start="270" data-line-end="271">“e9b8e00buo6tqmvu4vim”,</li>
<li class="has-line-data" data-line-start="271" data-line-end="275">“e9bu9fj59r30qfdet0n1”,<br>
] -&gt; null<br>
}</li>
</ul>
</li>
</ul>
</li>
</ul>
<h1 class="code-line" data-line-start=275 data-line-end=276 ><a id="yandex_vpc_route_tablenetologyrt_will_be_destroyed_275"></a>yandex_vpc_route_table.netology-rt will be destroyed</h1>
<ul>
<li class="has-line-data" data-line-start="276" data-line-end="290">resource “yandex_vpc_route_table” “netology-rt” {
<ul>
<li class="has-line-data" data-line-start="277" data-line-end="278">
<p class="has-line-data" data-line-start="277" data-line-end="278">created_at = “2022-06-05T18:25:04Z” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="278" data-line-end="279">
<p class="has-line-data" data-line-start="278" data-line-end="279">folder_id  = “b1gmg4vd0g5i14e03de0” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="279" data-line-end="280">
<p class="has-line-data" data-line-start="279" data-line-end="280">id         = “enppvec5s00h0kfh9dqr” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="280" data-line-end="281">
<p class="has-line-data" data-line-start="280" data-line-end="281">labels     = {} -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="281" data-line-end="282">
<p class="has-line-data" data-line-start="281" data-line-end="282">name       = “netology-rt” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="282" data-line-end="284">
<p class="has-line-data" data-line-start="282" data-line-end="283">network_id = “enp3rgpiqom0qf9nrk0v” -&gt; null</p>
</li>
<li class="has-line-data" data-line-start="284" data-line-end="290">
<p class="has-line-data" data-line-start="284" data-line-end="285">static_route {</p>
<ul>
<li class="has-line-data" data-line-start="285" data-line-end="286">destination_prefix = “0.0.0.0/0” -&gt; null</li>
<li class="has-line-data" data-line-start="286" data-line-end="290">next_hop_address   = “192.168.10.254” -&gt; null<br>
}<br>
}</li>
</ul>
</li>
</ul>
</li>
</ul>
<h1 class="code-line" data-line-start=290 data-line-end=291 ><a id="yandex_vpc_subnetprivate_will_be_destroyed_290"></a>yandex_vpc_subnet.private will be destroyed</h1>
<ul>
<li class="has-line-data" data-line-start="291" data-line-end="306">resource “yandex_vpc_subnet” “private” {
<ul>
<li class="has-line-data" data-line-start="292" data-line-end="293">created_at     = “2022-06-05T18:25:05Z” -&gt; null</li>
<li class="has-line-data" data-line-start="293" data-line-end="294">folder_id      = “b1gmg4vd0g5i14e03de0” -&gt; null</li>
<li class="has-line-data" data-line-start="294" data-line-end="295">id             = “e9b8e00buo6tqmvu4vim” -&gt; null</li>
<li class="has-line-data" data-line-start="295" data-line-end="296">labels         = {} -&gt; null</li>
<li class="has-line-data" data-line-start="296" data-line-end="297">name           = “netology-tf-private” -&gt; null</li>
<li class="has-line-data" data-line-start="297" data-line-end="298">network_id     = “enp3rgpiqom0qf9nrk0v” -&gt; null</li>
<li class="has-line-data" data-line-start="298" data-line-end="299">route_table_id = “enppvec5s00h0kfh9dqr” -&gt; null</li>
<li class="has-line-data" data-line-start="299" data-line-end="302">v4_cidr_blocks = [
<ul>
<li class="has-line-data" data-line-start="300" data-line-end="302">“192.168.20.0/24”,<br>
] -&gt; null</li>
</ul>
</li>
<li class="has-line-data" data-line-start="302" data-line-end="303">v6_cidr_blocks = [] -&gt; null</li>
<li class="has-line-data" data-line-start="303" data-line-end="306">zone           = “ru-central1-a” -&gt; null<br>
}</li>
</ul>
</li>
</ul>
<h1 class="code-line" data-line-start=306 data-line-end=307 ><a id="yandex_vpc_subnetpublic_will_be_destroyed_306"></a>yandex_vpc_subnet.public will be destroyed</h1>
<ul>
<li class="has-line-data" data-line-start="307" data-line-end="321">resource “yandex_vpc_subnet” “public” {
<ul>
<li class="has-line-data" data-line-start="308" data-line-end="309">created_at     = “2022-06-05T18:23:32Z” -&gt; null</li>
<li class="has-line-data" data-line-start="309" data-line-end="310">folder_id      = “b1gmg4vd0g5i14e03de0” -&gt; null</li>
<li class="has-line-data" data-line-start="310" data-line-end="311">id             = “e9bu9fj59r30qfdet0n1” -&gt; null</li>
<li class="has-line-data" data-line-start="311" data-line-end="312">labels         = {} -&gt; null</li>
<li class="has-line-data" data-line-start="312" data-line-end="313">name           = “netology-tf-public” -&gt; null</li>
<li class="has-line-data" data-line-start="313" data-line-end="314">network_id     = “enp3rgpiqom0qf9nrk0v” -&gt; null</li>
<li class="has-line-data" data-line-start="314" data-line-end="317">v4_cidr_blocks = [
<ul>
<li class="has-line-data" data-line-start="315" data-line-end="317">“192.168.10.0/24”,<br>
] -&gt; null</li>
</ul>
</li>
<li class="has-line-data" data-line-start="317" data-line-end="318">v6_cidr_blocks = [] -&gt; null</li>
<li class="has-line-data" data-line-start="318" data-line-end="321">zone           = “ru-central1-a” -&gt; null<br>
}</li>
</ul>
</li>
</ul>
<p class="has-line-data" data-line-start="321" data-line-end="322">Plan: 0 to add, 0 to change, 7 to destroy.</p>
<p class="has-line-data" data-line-start="323" data-line-end="324">Changes to Outputs:</p>
<ul>
<li class="has-line-data" data-line-start="324" data-line-end="325">private_vm_internal_ip = “192.168.20.28” -&gt; null</li>
<li class="has-line-data" data-line-start="325" data-line-end="326">public_vm_external_ip  = “51.250.88.225” -&gt; null</li>
<li class="has-line-data" data-line-start="326" data-line-end="328">public_vm_internal_ip  = “192.168.10.30” -&gt; null</li>
</ul>
<p class="has-line-data" data-line-start="328" data-line-end="331">Do you really want to destroy all resources?<br>
Terraform will destroy all your managed infrastructure, as shown above.<br>
There is no undo. Only ‘yes’ will be accepted to confirm.</p>
<p class="has-line-data" data-line-start="332" data-line-end="333">Enter a value: yes</p>
<p class="has-line-data" data-line-start="334" data-line-end="350">yandex_compute_instance.netology-nat: Destroying… [id=fhmev282cek87t41van1]<br>
yandex_compute_instance.netology-vm-private: Destroying… [id=fhm585j3hqsaaaam4mc6]<br>
yandex_compute_instance.netology-vm-public: Destroying… [id=fhmq227o7qfso4gj7soh]<br>
yandex_compute_instance.netology-vm-private: Destruction complete after 10s<br>
yandex_vpc_subnet.private: Destroying… [id=e9b8e00buo6tqmvu4vim]<br>
yandex_compute_instance.netology-vm-public: Still destroying… [id=fhmq227o7qfso4gj7soh, 10s elapsed]<br>
yandex_compute_instance.netology-nat: Still destroying… [id=fhmev282cek87t41van1, 10s elapsed]<br>
yandex_compute_instance.netology-vm-public: Destruction complete after 12s<br>
yandex_compute_instance.netology-nat: Destruction complete after 12s<br>
yandex_vpc_subnet.public: Destroying… [id=e9bu9fj59r30qfdet0n1]<br>
yandex_vpc_subnet.public: Destruction complete after 3s<br>
yandex_vpc_subnet.private: Destruction complete after 6s<br>
yandex_vpc_route_table.netology-rt: Destroying… [id=enppvec5s00h0kfh9dqr]<br>
yandex_vpc_route_table.netology-rt: Destruction complete after 1s<br>
yandex_vpc_network.netology-network-tf: Destroying… [id=enp3rgpiqom0qf9nrk0v]<br>
yandex_vpc_network.netology-network-tf: Destruction complete after 0s</p>
<p class="has-line-data" data-line-start="351" data-line-end="352">Destroy complete! Resources: 7 destroyed.</p>