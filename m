From: T Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 20:39:20 +0000
Subject: Re: [PATCH 00/21] Staging: cleaned up makefiles cflag lines
Message-Id: <AANLkTin1YfwwVcDNUBsi34iYC6HA5Y6+uOFZN=+Q2hqs@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTikqf4rn6BP2gyQAuQrvt7EdFY8yfa+o8nfR9xWE@mail.gmail.com>
	<AANLkTikvGGz+33ni=Kov1qM1DpSj2WVuk89u=TwE9iL_@mail.gmail.com>
In-Reply-To: <AANLkTikvGGz+33ni=Kov1qM1DpSj2WVuk89u=TwE9iL_@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfmooney@gmail.com>
Cc: greg@kroah.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 9/24/10, matt mooney <mfmooney@gmail.com> wrote:
> On Fri, Sep 24, 2010 at 11:25 AM, T Dent <tdent48227@gmail.com> wrote:
>> I changed every makefile in the staging directory to use the proper
>> ccflags-y option instead of EXTRA_CFLAGS. It builds also :) .
>
> Um, you didn't do a lot of these right. Maybe you should look into why
> the change was made in the first place. For semantic reasons, I was
> also changing the first assignment to ":=" from "+=".

I can resend them with the a small modification to the patch files if you want.

>
> Thanks,
> mfm
>
> --
> GPG-Key: 9AFE00EA
>
 Thanks,
Tracey Dent
