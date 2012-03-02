From: "Christian Benvenuti (benve)" <benve@cisco.com>
Date: Fri, 02 Mar 2012 01:23:45 +0000
Subject: RE: [patch] enic: fix an endian bug in enic_probe()
Message-Id: <184D23435BECB444AB6B9D4630C8EC8303853051@XMB-RCD-303.cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120301071954.GA7152@elgon.mountain> <20120301.172408.1182768164929080163.davem@davemloft.net>
In-Reply-To: <20120301.172408.1182768164929080163.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, dan.carpenter@oracle.com
Cc: "Roopa Prabhu (roprabhu)" <roprabhu@cisco.com>, "Neel Patel (neepatel)" <neepatel@cisco.com>, "Nishank Trivedi (nistrive)" <nistrive@cisco.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks Dan, David.

Just one quick comment...
pci_enable_sriov's 2nd input is declared as type int and we
were using u32 instead (for a non negative 16bit value).
With a quick check I noticed that other pci_enable_sriov callers
do something similar and may need to be taken care too:

driver    |  type used
----------+--------------
mlx4      | int
chelsio   | unsigned int
igb       | unsigned int   
igbxe     | unsigned int
emulex    | u32
vxge      | u32


Another option would have been to make all drivers use int
to match pci_enable_sriov (pci_enable_sriov->sriov_enable checks
against negative values).

(BTW, why is pci_enable_sriov prototype using int?)

Thanks
/Chris

> -----Original Message-----
> From: David Miller [mailto:davem@davemloft.net]
> Sent: Thursday, March 01, 2012 2:24 PM
> To: dan.carpenter@oracle.com
> Cc: Roopa Prabhu (roprabhu); Christian Benvenuti (benve); Neel Patel
> (neepatel); Nishank Trivedi (nistrive); netdev@vger.kernel.org;
kernel-
> janitors@vger.kernel.org
> Subject: Re: [patch] enic: fix an endian bug in enic_probe()
> 
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Thu, 1 Mar 2012 10:19:54 +0300
> 
> > "num_vfs" is a u32 but we only use the high 16 bits and the low
> 16bits
> > are left as zero.  That isn't a problem for little endian systems
but
> it
> > will break on big endian ones.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Applied.
