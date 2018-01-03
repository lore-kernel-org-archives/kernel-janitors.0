From: =?UTF-8?B?TWFoZXNoIEJhbmRld2FyICjgpK7gpLngpYfgpLYg4KSs4KSC4KSh4KWH4KS14KS+4KSwKQ
Date: Wed, 03 Jan 2018 19:28:18 +0000
Subject: Re: bonding: Delete an error message for a failed memory allocation in bond_update_slave_arr()
Message-Id: <CAF2d9jh1EHUx3BzWghBWRAZt4acO6W-_eUXtD7dk2YBJZfuwsg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6cdc726b-82bc-85b6-393b-0e2002c19341@users.sourceforge.net>
 <CAF2d9jhjL7pbcsEzwXRxLVzyMid5s2OY96AwSyRTuuqho-w_EQ@mail.gmail.com> <f93750d3-700f-897d-c4ef-2cf5b5a3374e@users.sourceforge.net>
In-Reply-To: <f93750d3-700f-897d-c4ef-2cf5b5a3374e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-netdev <netdev@vger.kernel.org>, Andy Gospodarek <andy@greyhouse.net>, Jay Vosburgh <j.vosburgh@gmail.com>, Veaceslav Falico <vfalico@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jan 3, 2018 at 12:45 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>>> Omit an extra message for a memory allocation failure in this function.
>>>
>>> This issue was detected by using the Coccinelle software.
>>>
>> What is the issue with this message?
>
> * Is it redundant?
>
> * Would a Linux allocation failure report be already sufficient here?
>
If you see 8 out of 9 call sites in this file ignore the return value.
This message in the log could give a clue when debugging. Unless it's
spamming it's not harmful, or is it?

> Regards,
> Markus
