From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Tue, 09 Jun 2020 05:59:36 +0000
Subject: Re: [PATCH] powerpc/powernv: Fix a warning message
Message-Id: <49gzwT05fTz9sTG@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200502115949.139000-1-christophe.jaillet@wanadoo.fr>
References: <20200502115949.139000-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200502115949.139000-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com, tglx@linutronix.de, maddy@linux.vnet.ibm.com, cclaudio@linux.ibm.com, zhangshaokun@hisilicon.com, atrajeev@linux.vnet.ibm.com, akshay.adiga@linux.vnet.ibm.com, ego@linux.vnet.ibm.com
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Sat, 2020-05-02 at 11:59:49 UTC, Christophe JAILLET wrote:
> Fix a cut'n'paste error in a warning message. This should be
> 'cpu-idle-state-residency-ns' to match the property searched in the
> previous 'of_property_read_u32_array()'
> 
> Fixes: 9c7b185ab2fe ("powernv/cpuidle: Parse dt idle properties into global structure")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/2f62870ca5bc9d305f3c212192320c29e9dbdc54

cheers
