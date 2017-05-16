From: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Date: Tue, 16 May 2017 13:56:18 +0000
Subject: Re: [PATCH] kvm: nVMX: off by one in vmx_write_pml_buffer()
Message-Id: <20170516135617.GB13731@potion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170510194317.uh72h3ez7hnvn62v@mwanda>
In-Reply-To: <20170510194317.uh72h3ez7hnvn62v@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

2017-05-10 22:43+0300, Dan Carpenter:
> There are PML_ENTITY_NUM elements in the pml_address[] array so the >
> should be >= or we write beyond the end of the array when we do:
> 
> 	pml_address[vmcs12->guest_pml_index--] = gpa;
> 
> Fixes: c5f983f6e845 ("nVMX: Implement emulated Page Modification Logging")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to kvm/master, thanks.

(v1 was deemed better after all.)
