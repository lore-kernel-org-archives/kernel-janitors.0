From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Mon, 05 Mar 2012 05:46:49 +0000
Subject: Re: [patch] pch_gbe: memory corruption calling pch_gbe_validate_option()
Message-Id: <CAOD=uF5+DHqxBW9waP3CYrfrq_WiBjWsyoKkZCSq+GvOsoUpMg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120301071708.GB6959@elgon.mountain>
	<20120301.172402.1035366198258013912.davem@davemloft.net>
In-Reply-To: <20120301.172402.1035366198258013912.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: David Miller <davem@davemloft.net>
Cc: dan.carpenter@oracle.com, masa-korg@dsn.okisemi.com, paul.gortmaker@windriver.com, jeffrey.t.kirsher@intel.com, mirq-linux@rere.qmqm.pl, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan,

        Your fix may introduce new bug.

         hw->phy.autoneg_advertised =3D tmp

       Assigning signed integer to unsigned short  leads to bit truncation.
       Is it safe for both Big-endian and little endian format ?

       AutoNeg is initialized with a Negative value (OPTION_UNSET)
        Won't it create any issue with above assignment ?


The simpler fix is to make "autoneg_advertised" signed integer.

struct pch_gbe_phy_info {
        u32 addr;
        u32 id;
        u32 revision;
        u32 reset_delay_us;
        u16 autoneg_advertised;     // =3D> int autoneg_advertised
};



Regards
Santosh




On Fri, Mar 2, 2012 at 3:54 AM, David Miller <davem@davemloft.net> wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Thu, 1 Mar 2012 10:17:08 +0300
>
>> pch_gbe_validate_option() modifies 32 bits of memory but we pass
>> &hw->phy.autoneg_advertised which only has 16 bits and &hw->mac.fc
>> which only has 8 bits.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Applied.
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
