From: Avi Kivity <avi@redhat.com>
Date: Wed, 11 Mar 2009 13:14:33 +0000
Subject: Re: [PATCH] KVM: make 'lapic_timer_ops' and 'kpit_ops' static
Message-Id: <49B7B939.6070009@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090310215053.11822.79188.stgit@f10box.hanneseder.net>
In-Reply-To: <20090310215053.11822.79188.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: kvm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hannes Eder wrote:
> Fix this sparse warnings:
>   arch/x86/kvm/lapic.c:916:22: warning: symbol 'lapic_timer_ops' was not declared. Should it be static?
>   arch/x86/kvm/i8254.c:268:22: warning: symbol 'kpit_ops' was not declared. Should it be static?
>
>   

Applied, thanks.

-- 
error compiling committee.c: too many arguments to function

