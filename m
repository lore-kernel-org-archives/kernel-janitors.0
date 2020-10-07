From: Joe Perches <joe@perches.com>
Date: Wed, 07 Oct 2020 18:27:04 +0000
Subject: Re: [PATCH] ima: Fix sizeof mismatches
Message-Id: <55ae0b6152c84013d483b1bbecb28a425801c408.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201007110243.19033-1-colin.king@canonical.com>
In-Reply-To: <20201007110243.19033-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Mimi Zohar <zohar@linux.ibm.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, Roberto Sassu <roberto.sassu@polito.it>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2020-10-07 at 12:02 +0100, Colin King wrote:
> An incorrect sizeof is being used, sizeof(*fields) is not correct,
> it should be sizeof(**fields). This is not causing a problem since
> the size of these is the same. Fix this in the kmalloc_array and
> memcpy calls.
[]
> diff --git a/security/integrity/ima/ima_template.c b/security/integrity/ima/ima_template.c
[]
> @@ -216,11 +216,11 @@ int template_desc_init_fields(const char *template_fmt,
>  	}
>  
>  	if (fields && num_fields) {
> -		*fields = kmalloc_array(i, sizeof(*fields), GFP_KERNEL);
> +		*fields = kmalloc_array(i, sizeof(**fields), GFP_KERNEL);
>  		if (*fields = NULL)
>  			return -ENOMEM;
>  
> -		memcpy(*fields, found_fields, i * sizeof(*fields));
> +		memcpy(*fields, found_fields, i * sizeof(**fields));

Maybe use kmemdup instead.

	if (fields && num_fields) {
		*fields = kmemdup(found_fields, i * sizeof(**fields), GFP_KERNEL);
		etc...
