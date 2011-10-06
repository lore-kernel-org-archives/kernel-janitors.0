From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Oct 2011 14:27:58 +0000
Subject: Re: [patch] [SCSI] aacraid: use lower snprintf() limit
Message-Id: <20111006142758.GB18470@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111005055046.GD32077@elgon.mountain>
 <d97a34694e741dc6a2a71fbcd49bab49.squirrel@webmail.sf-mail.de>
In-Reply-To: <d97a34694e741dc6a2a71fbcd49bab49.squirrel@webmail.sf-mail.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc: Adaptec OEM Raid Solutions <aacraid@adaptec.com>, "James E.J. Bottomley" <jbottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 05, 2011 at 09:35:13AM +0200, Rolf Eike Beer wrote:
> >  		  dev->supplement_adapter_info.MfgPcbaSerialNo);
> > +
> > +
> 
> One newline too much.
> 

True.  I wish checkpatch.pl checked for that...

> > +	if (len > 16)
> > +		len = 16;
> 
> max()?

min() actually.  I don't know that it improves the readability, but
can do.

regards,
dan carpenter
