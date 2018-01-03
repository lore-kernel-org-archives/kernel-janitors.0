From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 Jan 2018 08:45:35 +0000
Subject: Re: bonding: Delete an error message for a failed memory allocation in bond_update_slave_arr()
Message-Id: <f93750d3-700f-897d-c4ef-2cf5b5a3374e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6cdc726b-82bc-85b6-393b-0e2002c19341@users.sourceforge.net>
 <CAF2d9jhjL7pbcsEzwXRxLVzyMid5s2OY96AwSyRTuuqho-w_EQ@mail.gmail.com>
In-Reply-To: <CAF2d9jhjL7pbcsEzwXRxLVzyMid5s2OY96AwSyRTuuqho-w_EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?B?TWFoZXNoIEJhbmRld2FyICjgpK7gpLngpYfgpLYg4KSs4KSC4KSh4KWH4KS1?= =?UTF-8?B?4KS+4KSwKQ==?= <maheshb@google.com>, linux-netdev <netdev@vger.kernel.org>
Cc: Andy Gospodarek <andy@greyhouse.net>, Jay Vosburgh <j.vosburgh@gmail.com>, Veaceslav Falico <vfalico@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Omit an extra message for a memory allocation failure in this function.
>>
>> This issue was detected by using the Coccinelle software.
>>
> What is the issue with this message?

* Is it redundant?

* Would a Linux allocation failure report be already sufficient here?

Regards,
Markus
