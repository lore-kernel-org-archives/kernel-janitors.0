From: Belisko Marek <marek.belisko@gmail.com>
Date: Sun, 26 Sep 2010 16:56:53 +0000
Subject: Re: [PATCH] staging: ft1000: fix error path
Message-Id: <AANLkTin_4D6fF85+4dFe+qN9-nEBS8+oDMKRCtixMCPU@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285491595-377-1-git-send-email-segooon@gmail.com>
	<20100926131151.GC6134@bicker>
In-Reply-To: <20100926131151.GC6134@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>, Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Marek Belisko <marek.belisko@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sun, Sep 26, 2010 at 3:11 PM, Dan Carpenter <error27@gmail.com> wrote:
> On Sun, Sep 26, 2010 at 12:59:55PM +0400, Vasiliy Kulikov wrote:
>> +err_free:
>> +     for (i--; i>=0; i--) {
>> +             kfree(pdpram_blk->pbuffer);
>> +             kfree(pdpram_blk);
>> +     }
>
> This is wrong.  I don't have linux-next so I can't see the context, why
> are we looping here?  The second iteration through the loop will cause a
> NULL dereference.
Some lines upper there is allocation of structure and it's internal
buffer in loop:
for (i=0; i<NUM_OF_FREE_BUFFERS; i++) {
    // Get memory for DPRAM_DATA link list
    pdpram_blk = kmalloc ( sizeof(DPRAM_BLK), GFP_KERNEL );
    // Get a block of memory to store command data
    pdpram_blk->pbuffer = kmalloc ( MAX_CMD_SQSIZE, GFP_KERNEL );
    // link provisioning data
    list_add_tail (&pdpram_blk->list, &freercvpool);
}

Free loop is correct in my opinion but kfree should be extended by checking
of NULL pointer because allocation of pdpram_blk could fail and we free also
pdpram_blk->pbuffer.
>
> Also there should be spaces before and after the ">=".
>
> regards,
> dan carpenter
>
>> +     return STATUS_FAILURE;
>>  }
>>
>
>

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
