From: Jiri Slaby <jslaby@suse.cz>
Date: Sun, 27 Jan 2013 20:16:59 +0000
Subject: Re: [patch] TTY: synclink, small cleanup in dtr_rts()
Message-Id: <51058B3B.3010400@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130127194039.GA18787@elgon.mountain> <1359317078.14406.12.camel@joe-AO722>
In-Reply-To: <1359317078.14406.12.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Fulghum <paulkf@microgate.com>, David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01/27/2013 09:04 PM, Joe Perches wrote:
> On Sun, 2013-01-27 at 22:40 +0300, Dan Carpenter wrote:
>> There is a kind of precedence problem here, but it doesn't affect how
>> the code works because ->serial_signals is unsigned char.  We want to
>> clear two flags here.
>>
>> #define SerialSignal_RTS            0x20     /* Request to Send */
>> #define SerialSignal_DTR            0x80     /* Data Terminal Ready */
>>
>> Without the parenthesis then it does:
>>
>> 	info->serial_signals &= 0x5f;
>>
>> With the parenthesis it does:
>>
>> 	info->serial_signals &= 0xffffff5f;
>>
>> info->serial_signals is an unsigned char so the two statements are
>> equivalent, but it's cleaner to add the parenthesis.  In other dtr_rts()
>> functions the parenthesis are there so this makes it more consistent.
> 
> 
> Wouldn't it be clearer still to use | instead of +

Ack, the plus is a mindfuck.


-- 
js
suse labs
