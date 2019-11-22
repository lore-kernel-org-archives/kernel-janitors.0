From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Nov 2019 12:25:40 +0000
Subject: Re: [PATCH -next] KVM: x86: remove set but not used variable 'called'
Message-Id: <20191122120413.GI617@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119030640.25097-1-maowenan@huawei.com>
 <87o8x8gjr5.fsf@vitty.brq.redhat.com>
 <20191119121423.GB5604@kadam>
 <87imnggidr.fsf@vitty.brq.redhat.com>
 <20191119123956.GC5604@kadam>
 <87a78sgfqj.fsf@vitty.brq.redhat.com>
 <b24e2efc-2228-95ea-09b0-806a9b066eee@redhat.com>
In-Reply-To: <b24e2efc-2228-95ea-09b0-806a9b066eee@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nitesh Narayan Lal <nitesh@redhat.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Mao Wenan <maowenan@huawei.com>, pbonzini@redhat.com, rkrcmar@redhat.com, sean.j.christopherson@intel.com, wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>

On Fri, Nov 22, 2019 at 06:58:51AM -0500, Nitesh Narayan Lal wrote:
> For the build error, I didn't trigger it because I didn't compile with
> appropriate flags.

It's going to be a serveral years before we can enable that flag by
default.

regards,
dan carpenter
