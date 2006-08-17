From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 17 Aug 2006 14:41:17 +0000
Subject: Re: [KJ] Can we rely on RDTSC
Message-Id: <20060817144117.GJ4482@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c49434130608170545l74dfe98fqd39635e4ee3f6167@mail.gmail.com>
In-Reply-To: <c49434130608170545l74dfe98fqd39635e4ee3f6167@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 17.08.2006 [18:15:32 +0530], Tharindu Rukshan Bamunuarachchi wrote:
> Does Linux syncrhonize tsc (timer stam counter) values in-beetwen SMP
> cores?

You probably meant to ask this on the kernelnewbies list or LKML?

> If I read tsc value from different cores, will I get same value or
> dfferent value??

For those architectures that have TSCs, I am not sure if there is a
guarantee or not. For instance, on NUMA-Q, the TSCs are explicitly
unsynced.

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
