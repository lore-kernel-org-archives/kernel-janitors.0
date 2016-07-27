From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Wed, 27 Jul 2016 08:57:07 +0000
Subject: Re: [PATCH] cxl: Delete an unnecessary check before the function call "of_node_put"
Message-Id: <601fb58c-7aee-91ce-2a3d-7a29787968fc@au1.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <33fb6b04-9986-35ee-f4e2-0ebeb79c5e23@users.sourceforge.net>
 <alpine.DEB.2.10.1607201535270.2838@hadrien>
In-Reply-To: <alpine.DEB.2.10.1607201535270.2838@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Christophe Lombard <clombard@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ian Munsie <imunsie@au1.ibm.com>, linuxppc-dev@lists.ozlabs.org

On 20/07/16 23:38, Julia Lawall wrote:
> I don't think that the call should be there at all.  The loop only exits
> when afu_np is NULL.  Furthermore, the loop should not be written as a for
> loop, but rather with for_each_child_of_node.

Will send a patch to fix both issues shortly.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

