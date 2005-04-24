From: Domen Puncer <domen@coderock.org>
Date: Sun, 24 Apr 2005 10:40:44 +0000
Subject: [KJ] Re: kfree instead of kfree_skb : drivers/net/acenic.c
Message-Id: <20050424104044.GA3874@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============00088150824629806834=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============00088150824629806834==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 06/04/05 17:11 +0200, Christophe Lucas wrote:
> Description:
> Make sure no-one is freeing skbs with kfree instead of kfree_skb
...
> -		kfree(ap->skb);
> +		kfree_skb(ap->skb);

Compile test revealed ap->skb is not struct skbuff.


--===============00088150824629806834==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============00088150824629806834==--
