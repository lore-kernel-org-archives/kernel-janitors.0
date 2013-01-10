From: George Zhang <georgezhang@vmware.com>
Date: Thu, 10 Jan 2013 19:36:35 +0000
Subject: Re: VMCI: queue pairs implementation.
Message-Id: <117563178.6921475.1357846595066.JavaMail.root@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130110193238.GB17997@elgon.mountain>
In-Reply-To: <20130110193238.GB17997@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,
  And will fix this too,
  Thanks so much,
george

----- Original Message -----
> From: "Dan Carpenter" <dan.carpenter@oracle.com>
> To: georgezhang@vmware.com
> Cc: kernel-janitors@vger.kernel.org, kbuild@01.org
> Sent: Thursday, January 10, 2013 11:32:39 AM
> Subject: re: VMCI: queue pairs implementation.
> 
> Hello George Zhang,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 06164d2b72aa: "VMCI: queue pairs implementation." from Jan
> 8, 2013, leads to the following Smatch complaint:
> 
> drivers/misc/vmw_vmci/vmci_queue_pair.c:3356 vmci_qpair_dequev()
> 	 warn: variable dereferenced before check 'qpair' (see line 3354)
> 
> drivers/misc/vmw_vmci/vmci_queue_pair.c
>   3353
>   3354		qp_lock(qpair);
>                         ^^^^^^
> dereference.
> 
>   3355
>   3356		if (!qpair || !iov)
>                      ^^^^^
> test.
> 
>   3357			return VMCI_ERROR_INVALID_ARGS;
>   3358
> 
> regards,
> dan carpenter
> 
