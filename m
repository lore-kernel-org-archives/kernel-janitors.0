From: Avi Kivity <avi@redhat.com>
Date: Sun, 30 Nov 2008 10:17:59 +0000
Subject: Re: [PATCH] KVM: fix sparse warning
Message-Id: <49326857.2030501@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49304b32.0baa660a.462a.ffffb75d@mx.google.com>
In-Reply-To: <49304b32.0baa660a.462a.ffffb75d@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org

Hannes Eder wrote:
> Impact: make global function static
>
>   virt/kvm/kvm_main.c:85:6: warning: symbol 'kvm_rebooting' was not declared. Should it be static?
>   

Applied, thanks.

-- 
error compiling committee.c: too many arguments to function

