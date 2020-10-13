From: Mimi Zohar <zohar@linux.ibm.com>
Date: Tue, 13 Oct 2020 16:17:37 +0000
Subject: Re: [PATCH] ima: Fix sizeof mismatches
Message-Id: <ba5f4d90c714eba5d5a1d822bca25305b40a73e1.camel@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201007110243.19033-1-colin.king@canonical.com>
         <55ae0b6152c84013d483b1bbecb28a425801c408.camel@perches.com>
         <a9a35d8b480112fe40b45392d0f0e9dcb5be536e.camel@linux.ibm.com>
         <ea06c7431075c57d274a9076077f28fd2c7634a5.camel@perches.com>
         <0ceb198a-a313-f542-49cc-c0b9f6b1ea52@canonical.com>
In-Reply-To: <0ceb198a-a313-f542-49cc-c0b9f6b1ea52@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, Joe Perches <joe@perches.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, Roberto Sassu <roberto.sassu@polito.it>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2020-10-12 at 19:10 +0100, Colin Ian King wrote:
> On 12/10/2020 19:06, Joe Perches wrote:
> > On Mon, 2020-10-12 at 13:51 -0400, Mimi Zohar wrote:
> >> On Wed, 2020-10-07 at 11:27 -0700, Joe Perches wrote:
> >>> On Wed, 2020-10-07 at 12:02 +0100, Colin King wrote:
> >>>> An incorrect sizeof is being used, sizeof(*fields) is not correct,
> >>>> it should be sizeof(**fields). This is not causing a problem since
> >>>> the size of these is the same. Fix this in the kmalloc_array and
> >>>> memcpy calls.
> >>> []
> >>>> diff --git a/security/integrity/ima/ima_template.c b/security/integrity/ima/ima_template.c
> >>> []
> >>>> @@ -216,11 +216,11 @@ int template_desc_init_fields(const char *template_fmt,
> >>>>  	}
> >>>>  
> >>>>  	if (fields && num_fields) {
> >>>> -		*fields = kmalloc_array(i, sizeof(*fields), GFP_KERNEL);
> >>>> +		*fields = kmalloc_array(i, sizeof(**fields), GFP_KERNEL);
> >>>>  		if (*fields = NULL)
> >>>>  			return -ENOMEM;
> >>>>  
> >>>> -		memcpy(*fields, found_fields, i * sizeof(*fields));
> >>>> +		memcpy(*fields, found_fields, i * sizeof(**fields));
> >>>
> >>> Maybe use kmemdup instead.
> >>>
> >>> 	if (fields && num_fields) {
> >>> 		*fields = kmemdup(found_fields, i * sizeof(**fields), GFP_KERNEL);
> >>> 		etc...
> >>>
> >>
> >> Thanks, Joe.  Since this patch will be backported, perhaps it would be
> >> better to leave this as a bug fix and upstream other changes
> >> independently.
> > 
> > IMO:
> > 
> > This patch doesn't need need backporting as it doesn't
> > actually fix anything other than a style defect.
> > 
> > void * and void ** are the same size.
> 
> indeed, same size, it's a semantic difference *and* a style fix :-)

Colin, based on Joe's suggestion of using kmemdup and his opinion of
not backporting this change, can I assume you'll address his comments
and re-post v3?

thanks,

Mimi
