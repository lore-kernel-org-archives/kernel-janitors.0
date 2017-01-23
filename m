From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Jan 2017 11:08:12 +0000
Subject: Re: KVM: s390: Move two error code assignments in kvm_vm_ioctl_get_dirty_log()
Message-Id: <01d581bb-9db6-cba1-e476-49c814c3ebf0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <70f41e59-d8a4-de42-6064-80ecf6acc065@users.sourceforge.net>
 <35411200-2bd6-1c65-7d7f-21a6353875ea@de.ibm.com>
In-Reply-To: <35411200-2bd6-1c65-7d7f-21a6353875ea@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?Q?Christian_Borntr=c3=a4ger?= <borntraeger@de.ibm.com>, kvm@vger.kernel.org, linux-s390@vger.kernel.org
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Patches that changes open coded things to common helpers or things like
> kmalloc_array where appropriate or things that make the code more robust
> are fine and welcome, but I am not going to take this as it just shuffles
> things around.

Thanks for such information.


> It does not fix anything and it does not improve the code,

I have got an other expectation for the shown implementation detail.


> but it certainly carries the risk of breaking something

This is usual in software development, isn't it?


> (yes in this case it looks perfectly fine, though).

Thanks for this bit of positive feedback.


> Due to the locking requirements we cannot do such a simplification here.

I find this detail strange. Would you like to check run time consequences
for the shown error code settings once more?

Regards,
Markus
