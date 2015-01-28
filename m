From: "Serge E. Hallyn" <serge@hallyn.com>
Date: Wed, 28 Jan 2015 06:52:45 +0000
Subject: Re: [patch] SELinux: fix error code in policydb_init()
Message-Id: <20150128065245.GB13794@mail.hallyn.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150128064239.GB30893@mwanda>
In-Reply-To: <20150128064239.GB30893@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-security-module@vger.kernel.org, Himangi Saraogi <himangi774@gmail.com>, James Morris <james.l.morris@oracle.com>, Namhyung Kim <namhyung@kernel.org>, Stephen Smalley <sds@tycho.nsa.gov>, selinux@tycho.nsa.gov

Quoting Dan Carpenter (dan.carpenter@oracle.com):
> If hashtab_create() returns a NULL pointer then we should return -ENOMEM
> but instead the current code returns success.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Serge Hallyn <serge.hallyn@canonical.com>

> 
> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index bc2a586..74aa224 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -289,12 +289,16 @@ static int policydb_init(struct policydb *p)
>  		goto out;
>  
>  	p->filename_trans = hashtab_create(filenametr_hash, filenametr_cmp, (1 << 10));
> -	if (!p->filename_trans)
> +	if (!p->filename_trans) {
> +		rc = -ENOMEM;
>  		goto out;
> +	}
>  
>  	p->range_tr = hashtab_create(rangetr_hash, rangetr_cmp, 256);
> -	if (!p->range_tr)
> +	if (!p->range_tr) {
> +		rc = -ENOMEM;
>  		goto out;
> +	}
>  
>  	ebitmap_init(&p->filename_trans_ttypes);
>  	ebitmap_init(&p->policycaps);
