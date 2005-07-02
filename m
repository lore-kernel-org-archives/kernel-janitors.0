From: Domen Puncer <domen@coderock.org>
Date: Sat, 02 Jul 2005 19:40:55 +0000
Subject: [KJ] Re: GCC4 audit.c warning: no return statement in function
Message-Id: <20050702194055.GB2260@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52476084519804211=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52476084519804211==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01/07/05 17:03 -0700, Jesse Millan wrote:
>  {
>  	struct sk_buff *skb;
> +	int err = 0;
>  
>  	while (1) {
>  		skb = skb_dequeue(&audit_skb_queue);
>  		if (skb) {
>  			if (audit_pid) {
> -				int err = netlink_unicast(audit_sock, skb, audit_pid, 0);
> +				err = netlink_unicast(audit_sock, skb, audit_pid, 0);
>  				if (err < 0) {
>  					BUG_ON(err != -ECONNREFUSED); /* Shoudn't happen */
>  					printk(KERN_ERR "audit: *NO* daemon at audit_pid=%d\n", audit_pid);
> @@ -305,6 +306,7 @@ int kauditd_thread(void *dummy)
>  			remove_wait_queue(&kauditd_wait, &wait);
>  		}
>  	}
> +	return err;
>  }

Doesn't this warn about unreachable code? ;-)

Randy's suggestion seems right.


	Domen

--===============52476084519804211==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52476084519804211==--
