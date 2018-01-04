From: =?UTF-8?B?TWFoZXNoIEJhbmRld2FyICjgpK7gpLngpYfgpLYg4KSs4KSC4KSh4KWH4KS14KS+4KSwKQ
Date: Thu, 04 Jan 2018 18:52:35 +0000
Subject: Re: bonding: Completion of error handling around bond_update_slave_arr()
Message-Id: <CAF2d9jjyfWT8Nm1V3fCKSrEE4Xs9gShs7nvj+dAYqXg42kUhvg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6cdc726b-82bc-85b6-393b-0e2002c19341@users.sourceforge.net>
 <CAF2d9jhjL7pbcsEzwXRxLVzyMid5s2OY96AwSyRTuuqho-w_EQ@mail.gmail.com>
 <f93750d3-700f-897d-c4ef-2cf5b5a3374e@users.sourceforge.net>
 <CAF2d9jh1EHUx3BzWghBWRAZt4acO6W-_eUXtD7dk2YBJZfuwsg@mail.gmail.com> <4af2b714-245a-0f0d-5982-818d5f81cade@users.sourceforge.net>
In-Reply-To: <4af2b714-245a-0f0d-5982-818d5f81cade@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-netdev <netdev@vger.kernel.org>, Andy Gospodarek <andy@greyhouse.net>, Jay Vosburgh <j.vosburgh@gmail.com>, Veaceslav Falico <vfalico@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Jan 4, 2018 at 12:19 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>> If you see 8 out of 9 call sites in this file ignore the return value.
>
> How do you think about to fix error detection and corresponding
> exception handling then?
>
If I understand your question correctly - not having memory is not a
correctable error and hence there are consequences. In this case, the
slave_arr is not going to be rebuilt and this might mean loosing
packets (if the interface was dropped) or not using the interface to
send packets if  that was added (very unlikely case). From host's
perspective, however, this might be the last thing you want to worry
about when there is no memory left.

> Regards,
> Markus
