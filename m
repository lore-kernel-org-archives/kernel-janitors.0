From: James Smart <James.Smart@Emulex.Com>
Date: Mon, 09 Feb 2009 21:39:28 +0000
Subject: Re: [PATCH 1/6] drivers/scsi: introduce missing kfree
Message-Id: <4990A290.3030406@emulex.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0902082242290.25891@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0902082242290.25891@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "James.Bottomley@HansenPartnership.com" <James.Bottomley@HansenPartnership.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Acked-by: James Smart <james.smart@emulex.com>

-- james s


Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Error handling code following a kmalloc should free the allocated data.
> 
> The semantic match that finds the problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @r exists@
> local idexpression x;
> statement S;
> expression E;
> identifier f,l;
> position p1,p2;
> expression *ptr != NULL;
> @@
> 
> (
> if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) = NULL) S
> |
> x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
> ...
> if (x = NULL) S
> )
> <... when != x
>      when != if (...) { <+...x...+> }
> x->f = E
> ...>
> (
>  return \(0\|<+...x...+>\|ptr\);
> |
>  return@p2 ...;
> )
> 
> @script:python@
> p1 << r.p1;
> p2 << r.p2;
> @@
> 
> print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
>  drivers/scsi/lpfc/lpfc_els.c        |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
> index a8f30bd..a730248 100644
> --- a/drivers/scsi/lpfc/lpfc_els.c
> +++ b/drivers/scsi/lpfc/lpfc_els.c
> @@ -5258,6 +5258,7 @@ lpfc_send_els_event(struct lpfc_vport *vport,
>                         sizeof(struct lpfc_name));
>                 break;
>         default:
> +               kfree(els_data);
>                 return;
>         }
>         memcpy(els_data->wwpn, &ndlp->nlp_portname, sizeof(struct lpfc_name));
> 
