From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 06 May 2017 05:02:14 +0000
Subject: Re: [PATCH] firmware: Google VPD: Fix memory allocation error handling
Message-Id: <288831dc-38d6-21fd-118f-bcc0d44c0755@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170505190844.2945-1-christophe.jaillet@wanadoo.fr>
 <20170505195647.GB7351@kroah.com>
In-Reply-To: <20170505195647.GB7351@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg KH <gregkh@linuxfoundation.org>
Cc: thierry.escande@collabora.com, wnhuang@google.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 05/05/2017 =E0 21:56, Greg KH a =E9crit :
> On Fri, May 05, 2017 at 09:08:44PM +0200, Christophe JAILLET wrote:
>> This patch fixes several issues:
>>     - if the 1st 'kzalloc' fails, we dereference a NULL pointer
>>     - if the 2nd 'kzalloc' fails, there is a memory leak
>>     - if 'sysfs_create_bin_file' fails there is also a memory leak
> Then it should be multiple patches, not fixing 3 things in one patch,
> right?
>
> thanks,
>
> greg k-h
>
I can split it if you want, but the 3 points are more or less related=20
and all belong to the same few lines of code. I didn't think having 3=20
patches was needed in this case. I just wanted to give a detailed changelog.
If the commit message was only "This patch fixes memory allocation error=20
handling in fct xxx' (as in the topic), I guess it would has been=20
accepted (if it is correct of course) as-is.

Just tell me if you really prefer 3 patches, and I will resubmit.

CJ

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
