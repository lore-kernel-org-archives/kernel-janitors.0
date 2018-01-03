From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 03 Jan 2018 21:58:32 +0000
Subject: Re: bonding: Delete an error message for a failed memory allocation in bond_update_slave_arr()
Message-Id: <1515016712.131759.0.camel@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6cdc726b-82bc-85b6-393b-0e2002c19341@users.sourceforge.net>
         <CAF2d9jhjL7pbcsEzwXRxLVzyMid5s2OY96AwSyRTuuqho-w_EQ@mail.gmail.com>
         <f93750d3-700f-897d-c4ef-2cf5b5a3374e@users.sourceforge.net>
         <CAF2d9jh1EHUx3BzWghBWRAZt4acO6W-_eUXtD7dk2YBJZfuwsg@mail.gmail.com>
In-Reply-To: <CAF2d9jh1EHUx3BzWghBWRAZt4acO6W-_eUXtD7dk2YBJZfuwsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Mahesh Bandewar =?UTF-8?Q?=28=E0=A4=AE=E0=A4=B9=E0=A5=87=E0=A4=B6_?= =?UTF-8?Q?=E0=A4=AC=E0=A4=82=E0=A4=A1=E0=A5=87=E0=A4=B5=E0=A4=BE?= =?UTF-8?Q?=E0=A4=B0=29?= <maheshb@google.com>, SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-netdev <netdev@vger.kernel.org>, Andy Gospodarek <andy@greyhouse.net>, Jay Vosburgh <j.vosburgh@gmail.com>, Veaceslav Falico <vfalico@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, 2018-01-03 at 11:28 -0800, Mahesh Bandewar (महेश बंडेवार)
wrote:
> On Wed, Jan 3, 2018 at 12:45 AM, SF Markus Elfring
> <elfring@users.sourceforge.net> wrote:
> > > > Omit an extra message for a memory allocation failure in this function.
> > > > 
> > > > This issue was detected by using the Coccinelle software.
> > > > 
> > > 
> > > What is the issue with this message?
> > 
> > * Is it redundant?
> > 
> > * Would a Linux allocation failure report be already sufficient here?
> > 
> 
> If you see 8 out of 9 call sites in this file ignore the return value.
> This message in the log could give a clue when debugging. Unless it's
> spamming it's not harmful, or is it?

A failed kzalloc() would already give a complete stack trace.

Really the pr_err() adds no value here.


