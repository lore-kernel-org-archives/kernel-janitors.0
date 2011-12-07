From: "H. Peter Anvin" <hpa@zytor.com>
Date: Wed, 07 Dec 2011 18:14:11 +0000
Subject: Re: [patch -next] x86: dubious one-bit signed bitfields
Message-Id: <4EDFACF3.5070201@zytor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111207063848.GA14507@elgon.mountain>
In-Reply-To: <20111207063848.GA14507@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/06/2011 11:58 PM, Dan Carpenter wrote:
> 
> Sure.  Bool takes one byte, so it would be: bool
> sig_on_uaccess_error:1; bool			uaccess_err:1;  /* uaccess failed
> */
> 
> The __u8 types mean that we're trying to not polute the posix 
> namespace?  Does that affect bool?  I'm not sure the rules with
> that.
> 

If these headers are exported to userspace it might be unsuitable, and
yes, better mark them "unsigned".  If they are kernel-only it doesn't
matter.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

