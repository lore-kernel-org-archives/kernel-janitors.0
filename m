From: Randy Dunlap <rdunlap@infradead.org>
Date: Fri, 13 Sep 2019 22:36:03 +0000
Subject: Re: Problems during compiling in kernel modules
Message-Id: <ff4b5c99-086b-4456-fb2b-643a6caefcee@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190913173821.GA5986@SARKAR> <20190913180103.GB5986@SARKAR>
In-Reply-To: <20190913180103.GB5986@SARKAR>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rohit Sarkar <rohitsarkar5398@gmail.com>, linux-newbie@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org

On 9/13/19 11:01 AM, Rohit Sarkar wrote:
> On Fri, Sep 13, 2019 at 11:08:21PM +0530, Rohit Sarkar wrote:
>> Hi,
>> I was trying to compile a particular folder in my kernel tree.
>>
>> AFAIK the way to do this is:
>> `make drivers/staging/iio/` from the kernel base directory.
>>
>> This gives me the following output:
>> `
>>   CALL    scripts/checksyscalls.sh
>>   CALL    scripts/atomic/check-atomics.sh
>>   DESCEND  objtool
>> `
>>
>> No object files are generated.
>> I feel like I am missing something.
>>
>> Thanks,
>> Rohit
> 
> I ran `make clean` in the `drivers/iio/accel` directory which removed
> all object files in the first place. However running make after that
> doesnt seem to compile the modules.

Hi,
It works for me.  Do you have a kernel .config file?
Does it set/enable CONFIG_IIO and some/any/all drivers in drivers/iio/accel/ ?

If you don't have a kernel .config file, I don't expect it to work.
-- 
~Randy
