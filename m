From: Avi Kivity <avi@redhat.com>
Date: Sun, 30 Nov 2008 10:15:55 +0000
Subject: Re: [PATCH] KVM: VMX: fix sparse warning
Message-Id: <493267DB.90303@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49304b16.0ab6660a.0d69.ffff9a04@mx.google.com>
In-Reply-To: <49304b16.0ab6660a.0d69.ffff9a04@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org

Hannes Eder wrote:
> Impact: make global function static
>
>   arch/x86/kvm/vmx.c:134:3: warning: symbol 'vmx_capability' was not declared. Should it be static?
>   

Applied, thanks.

-- 
error compiling committee.c: too many arguments to function

