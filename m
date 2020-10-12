From: Mimi Zohar <zohar@linux.ibm.com>
Date: Mon, 12 Oct 2020 17:51:11 +0000
Subject: Re: [PATCH] ima: Fix sizeof mismatches
Message-Id: <a9a35d8b480112fe40b45392d0f0e9dcb5be536e.camel@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201007110243.19033-1-colin.king@canonical.com>
         <55ae0b6152c84013d483b1bbecb28a425801c408.camel@perches.com>
In-Reply-To: <55ae0b6152c84013d483b1bbecb28a425801c408.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Colin King <colin.king@canonical.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, Roberto Sassu <roberto.sassu@polito.it>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2020-10-07 at 11:27 -0700, Joe Perches wrote:
> On Wed, 2020-10-07 at 12:02 +0100, Colin King wrote:
> > An incorrect sizeof is being used, sizeof(*fields) is not correct,
> > it should be sizeof(**fields). This is not causing a problem since
> > the size of these is the same. Fix this in the kmalloc_array and
> > memcpy calls.
> []
> > diff --git a/security/integrity/ima/ima_template.c b/security/integrity/ima/ima_template.c
> []
> > @@ -216,11 +216,11 @@ int template_desc_init_fields(const char *template_fmt,
> >  	}
> >  
> >  	if (fields && num_fields) {
> > -		*fields = kmalloc_array(i, sizeof(*fields), GFP_KERNEL);
> > +		*fields = kmalloc_array(i, sizeof(**fields), GFP_KERNEL);
> >  		if (*fields = NULL)
> >  			return -ENOMEM;
> >  
> > -		memcpy(*fields, found_fields, i * sizeof(*fields));
> > +		memcpy(*fields, found_fields, i * sizeof(**fields));
> 
> Maybe use kmemdup instead.
> 
> 	if (fields && num_fields) {
> 		*fields = kmemdup(found_fields, i * sizeof(**fields), GFP_KERNEL);
> 		etc...
> 

Thanks, Joe.  Since this patch will be backported, perhaps it would be
better to leave this as a bug fix and upstream other changes
independently.

Mimi
