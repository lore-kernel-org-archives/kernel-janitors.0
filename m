From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 06 Mar 2019 02:38:57 +0000
Subject: Re: [bug report] appletalk: Fix use-after-free in atalk_proc_exit
Message-Id: <161b1219-eee9-791c-0506-3ae164aa3364@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190305154329.GA18084@kadam>
In-Reply-To: <20190305154329.GA18084@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2019/3/5 23:43, Dan Carpenter wrote:
> Hello YueHaibing,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 6377f787aeb9: "appletalk: Fix use-after-free in 
> atalk_proc_exit" from Mar 1, 2019, leads to the following Smatch 
> complaint:
> 
>     net/appletalk/ddp.c:1952 atalk_init()
>     error: we previously assumed 'ddp_dl' could be null (see line 1924)
> 

Yes, all the callers of register_snap_client seems not handling the null,
it just print a warning. I'll try fix it.

Thanks!

> net/appletalk/ddp.c
>   1923		ddp_dl = register_snap_client(ddp_snap_id, atalk_rcv);
>   1924		if (!ddp_dl)
>                     ^^^^^^^
> Check
> 
>   1925			printk(atalk_err_snap);
>   1926	
>   1927		dev_add_pack(&ltalk_packet_type);
>   1928		dev_add_pack(&ppptalk_packet_type);
>   1929	
>   1930		rc = register_netdevice_notifier(&ddp_notifier);
>   1931		if (rc)
>   1932			goto out_sock;
>   1933	
>   1934		aarp_proto_init();
>   1935		rc = atalk_proc_init();
>   1936		if (rc)
>   1937			goto out_aarp;
>   1938	
>   1939		rc = atalk_register_sysctl();
>   1940		if (rc)
>   1941			goto out_proc;
>   1942	out:
>   1943		return rc;
>   1944	out_proc:
>   1945		atalk_proc_exit();
>   1946	out_aarp:
>   1947		aarp_cleanup_module();
>   1948		unregister_netdevice_notifier(&ddp_notifier);
>   1949	out_sock:
>   1950		dev_remove_pack(&ppptalk_packet_type);
>   1951		dev_remove_pack(&ltalk_packet_type);
>   1952		unregister_snap_client(ddp_dl);
>                                        ^^^^^^
> Unchecked dereference.
> 
>   1953		sock_unregister(PF_APPLETALK);
>   1954	out_proto:
> 
> regards,
> dan carpenter
> 
> 
