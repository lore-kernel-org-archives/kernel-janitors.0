From: Joerg Roedel <joro@8bytes.org>
Date: Thu, 18 May 2017 11:39:12 +0000
Subject: Re: [PATCH 2/2] KVM: Tidy the whitespace in nested_svm_check_permissions()
Message-Id: <20170518113912.GF1912@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170518073853.b3dkw2zibj7ayvwh@mwanda>
 <20170518073953.uz6ix4azwlgvfa3k@mwanda>
In-Reply-To: <20170518073953.uz6ix4azwlgvfa3k@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 18, 2017 at 10:39:53AM +0300, Dan Carpenter wrote:
> I moved the || to the line before.  Also I replaced some spaces with a
> tab on the "return 0;" line.  It looks OK in the diff but originally
> that line was only indented 7 spaces.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Joerg Roedel <jroedel@suse.de>

