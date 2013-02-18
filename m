From: "Huang, Xiong" <xiong@qca.qualcomm.com>
Date: Mon, 18 Feb 2013 23:39:25 +0000
Subject: RE: atl1c: Atheros L1C Gigabit Ethernet driver
Message-Id: <157393863283F442885425D2C4542856489D2699@nasanexd02f.na.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130215103428.GA4609@elgon.mountain>
In-Reply-To: <20130215103428.GA4609@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

No, he has left this company.  Can you please replace it with nic-devel@qca.qualcomm.com ? thanks a lot !

-Xiong

> -----Original Message-----
> From: J. K. Cliburn [mailto:jcliburn@gmail.com]
> Sent: Tuesday, February 19, 2013 5:54 AM
> To: Dan Carpenter
> Cc: Chris Snook; kernel-janitors@vger.kernel.org; Huang, Xiong
> Subject: Re: atl1c: Atheros L1C Gigabit Ethernet driver
> 
> Xiong,
> 
> Is Jie still an active maintainer of atl1c?
> 
> Thanks,
> Jay
> 
> On 02/15/2013 05:12 AM, Dan Carpenter wrote:
> > Jie Yang's email is bouncing.  2009 was a long time ago.  Jay, Chris,
> > any ideas?
> >
> > regards,
> > dan carpenter
> >
> > On Fri, Feb 15, 2013 at 01:34:28PM +0300, Dan Carpenter wrote:
> >> Hello Jie Yang,
> >>
> >> The patch 43250ddd75a3: "atl1c: Atheros L1C Gigabit Ethernet driver"
> >> from Feb 18, 2009, leads to the following Smatch warning:
> >> "drivers/net/ethernet/atheros/atl1c/atl1c_hw.c:472
> atl1c_phy_setup_adv()
> >> 	 warn: odd binop '0x300 & 0xfffffffffffffcff'"
> >>
> >> [ This check as too many false positives so I haven't released it ]
> >>
> >> drivers/net/ethernet/atheros/atl1c/atl1c_hw.c
> >>     472          u16 mii_giga_ctrl_data = GIGA_CR_1000T_DEFAULT_CAP &
> >>     473                                  ~GIGA_CR_1000T_SPEED_MASK;
> >>
> >> The defines are set up like this:
> >>
> >> #define GIGA_CR_1000T_SPEED_MASK        0x0300
> >> #define GIGA_CR_1000T_DEFAULT_CAP       0x0300
> >>
> >> So we're just setting mii_giga_ctrl_data to zero.  It seems odd.  Did
> >> you intend to do the bitwise negate of GIGA_CR_1000T_SPEED_MASK?
> >> They're only used one time so I can't tell from the context what was
> >> intented.
> >>
> >> regards,
> >> dan carpenter

