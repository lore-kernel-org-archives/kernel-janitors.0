From: Marcos Souza <marcos.mage@gmail.com>
Date: Mon, 07 Nov 2011 11:52:55 +0000
Subject: Re: [PATCH] drivers/staging/vt6656/iwctl.c: Remove PRINT_K macro
Message-Id: <CAGkUK2vmtqrBv00juL8aNrFCiuNkTEfCOFrtrT+3YLC0LYn_Hw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1320634885-5845-1-git-send-email-marcos.mage@gmail.com>
In-Reply-To: <1320634885-5845-1-git-send-email-marcos.mage@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

2011/11/7, Dan Carpenter <dan.carpenter@oracle.com>:
> On Mon, Nov 07, 2011 at 07:27:52AM -0300, Marcos Souza wrote:
>> 2011/11/7, Dan Carpenter <dan.carpenter@oracle.com>:
>> > Hi Marcos,
>> >
>> > This should be sent to devel@driverdev.osuosl.org as well.
>> On copy this time
>> > DBG_PRT() is just as bad as PRINT_K().  The first example in
>> > iwctl_siwscan() should be either pr_debug() or dev_dbg().  Also the
>> > message itself is wrong.
>> So, I'll send patches to change all these print_k and dbg_prt to dev_dbg
>
> It's not as simple as doing a sed over the driver.  You have to look
> at each one and decide what it should be.  I only looked at the first
> PRINT_K() and said specific one should be a pr_debug() not that all
> of them should.
Sorry, I think I was not so clear as I wanted. I'll analyse all the
uses of dbg_prt and print_k, and change these as they can be assigned
to pr_debug and dev_dbg.
> regards,
> dan carpenter
>
>


--=20
Marcos Paulo de Souza

*Porque uma vida sem desafios =E9 uma vida sem raz=E3o.*
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
