From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 27 Aug 2012 03:46:32 +0000
Subject: Re: [kvm:next 1/1] (.text+0x2ac8): undefined reference to `.gfn_to_hva_memslot'
Message-Id: <20120827034632.GA15084@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120824151127.GA7171@localhost>
 <503ADC68.1060207@linux.vnet.ibm.com>
In-Reply-To: <503ADC68.1060207@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xiao Guangrong <xiaoguangrong@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, Avi Kivity <avi@redhat.com>, kvm@vger.kernel.org

On Mon, Aug 27, 2012 at 10:33:12AM +0800, Xiao Guangrong wrote:
> On 08/24/2012 11:11 PM, Fengguang Wu wrote:
> > Hi Xiao,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/virt/kvm/kvm.git next
> > head:   4d8b81abc47b83a1939e59df2fdb0e98dfe0eedd
> > commit: 4d8b81abc47b83a1939e59df2fdb0e98dfe0eedd [1/1] KVM: introduce readonly memslot
> > config: powerpc-allmodconfig (attached as .config)
> > 
> > All related error/warning messages:
> > 
> > arch/powerpc/kvm/built-in.o: In function `.kvmppc_h_enter':
> > (.text+0x2ac8): undefined reference to `.gfn_to_hva_memslot'
> 
> Fengguang, it is a known issue which can be fixed by this patch:
> https://patchwork.kernel.org/patch/1370121/

OK, you are quick hand :)

> Thanks for your test and report. ;)

You are welcome.

Thanks,
Fengguang
