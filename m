From: Mimi Zohar <zohar@linux.ibm.com>
Date: Wed, 03 Jul 2019 11:14:39 +0000
Subject: Re: [PATCH] ima: Replace two seq_printf() calls by seq_puts() in ima_show_template_data_ascii()
Message-Id: <1562152479.4774.18.camel@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e96eac40-0745-80b5-6aab-f872e6415031@web.de>
         <d94bfdb9d53b46059787b9bdd10c5919@AcuMS.aculab.com>
In-Reply-To: <d94bfdb9d53b46059787b9bdd10c5919@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: David Laight <David.Laight@ACULAB.COM>, 'Markus Elfring' <Markus.Elfring@web.de>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, 2019-07-03 at 09:16 +0000, David Laight wrote:

> > diff --git a/security/integrity/ima/ima_template_lib.c b/security/integrity/ima/ima_template_lib.c
> > index 9fe0ef7f91e2..05636e9b19b1 100644
> > --- a/security/integrity/ima/ima_template_lib.c
> > +++ b/security/integrity/ima/ima_template_lib.c
> > @@ -74,7 +74,7 @@ static void ima_show_template_data_ascii(struct seq_file *m,
> >  	case DATA_FMT_DIGEST_WITH_ALGO:
> >  		buf_ptr = strnchr(field_data->data, buflen, ':');
> >  		if (buf_ptr != field_data->data)
> > -			seq_printf(m, "%s", field_data->data);
> > +			seq_puts(m, field_data->data);
> > 
> >  		/* skip ':' and '\0' */
> >  		buf_ptr += 2;
> 
> That code looks highly suspect!
> It uses a bounded scan then assumes a '\0' terminated string.
> It then adds 2 to a potentially NULL pointer.

The code here is used for displaying the IMA measurement list, that
the kernel itself created.  Protecting the in kernel memory from
attack is a different problem.  Refer to Igor Stoppa's write once
memory pools.

Mimi
