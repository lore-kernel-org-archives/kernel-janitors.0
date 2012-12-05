From: Chen Gang <gang.chen@asianux.com>
Date: Wed, 05 Dec 2012 01:30:41 +0000
Subject: Re: [patch] telephony: ijx: buffer overflow in ixj_write_cid()
Message-Id: <50BEA3C1.3070204@asianux.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121203190512.GA9273@elgon.mountain>
In-Reply-To: <20121203190512.GA9273@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

于 2012年12月04日 03:10, Greg Kroah-Hartman 写道:
> On Mon, Dec 03, 2012 at 10:05:12PM +0300, Dan Carpenter wrote:
>> We get this from user space and nothing has been done to ensure that
>> these strings are NUL terminated.
>>
>> Cc: stable@vger.kernel.org
>> Reported-by: Chen Gang <gang.chen@asianux.com>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> This driver is going to be removed in the 3.8 kernel but the fix is
>> needed for 3.7 and older.
> 
> Ok, I'll queue it up for 3.7.1 and older stable kernels at that time, as
> it's too late for 3.7-final right now, especially as no one is even
> using this code :)
> 
> thanks,
> 
> greg k-h
> 
> 

  thank you very much.

  :-)

-- 
Chen Gang

Asianux Corporation
