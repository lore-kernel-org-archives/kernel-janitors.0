From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 16 Nov 2006 07:05:50 +0000
Subject: Re: [KJ] adds check to copy_to_user() in function qeth_arp_query()
Message-Id: <20061115230550.ef64d7cf.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2aac3c260611081309q5f35356eu89f94a7856efdfea@mail.gmail.com>
In-Reply-To: <2aac3c260611081309q5f35356eu89f94a7856efdfea@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 8 Nov 2006 22:09:57 +0100 Giangiacomo Mariotti wrote:

> adds a check to values returned by calls to copy_to_user() in function
> qeth_arp_query() in file drivers/s390/net/qeth_main.c
> 
> Signed-off-by: Giangiacomo Mariotti <giangiacomo.mariotti@gmail.com>
> 
> -------------------------

)attachment provides no patch lines here to comment on :(

ok, copy/paste:

+	if(tmp)
+		return -EFAULT;
+	else
+		return rc;

style:
	if (tmp)

and then I would just do:

	if (tmp)
		return -EFAULT;
	return rc;


---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
