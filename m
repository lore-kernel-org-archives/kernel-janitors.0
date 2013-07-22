From: walter harms <wharms@bfs.de>
Date: Mon, 22 Jul 2013 07:51:36 +0000
Subject: Re: [patch] mtd: use correct error codes in debugfs_create()
Message-Id: <51ECE488.1050307@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130719054938.GC9729@elgon.mountain>
 <20130722055607.GF5636@mwanda>
In-Reply-To: <20130722055607.GF5636@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org



Am 22.07.2013 07:56, schrieb Dan Carpenter:
> On Fri, Jul 19, 2013 at 08:49:38AM +0300, Dan Carpenter wrote:
>> The test here is reversed.  It should be that if "dent" is a valid error
>> code then we use it, otherwise if it is NULL then use -ENODEV.
>>
> 
> People have explained the debugfs_create API to me better and now
> I'm not sure what to do here...  debugfs_create_dir() returns a
> NULL on error and if debugfs is not enabled then it returns -ENODEV.
> We test for if (!IS_ENABLED(CONFIG_DEBUG_FS)) earlier in the
> function so it can only return NULL.
> 
> Probably I should just change the test to only test for NULL?
> 
> Otherwise I think my patch is correct.  The original code will
> return success on error (NULL return) and that was not intended.
> 

Hi Dan,
i have a simple question, what to do in case of error ?

Situation 1: debugfs_create_dir returns NULL
something went wrong dir not created
if all other debugfs_ function will check for NULL someone could even ignore the check
and let the others handle that.

Situation 2: debugfs_create_dir returns ENODOV
The man page says: please ignore
I only use i could come up with is to inform the user that no debugfs is available.
But the returning pointer would now point to an error an not the expected dentry.
So have to you make sure that it becomes NULL otherwise the other debugfs function will go crasy.
(Can this happen actually ?)
Did i miss something ?

In Summa:
may it is better for debugfs_ to return NULL instead of an error ?

re,
 wh








