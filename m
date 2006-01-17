From: Keith Owens <kaos@ocs.com.au>
Date: Tue, 17 Jan 2006 03:56:52 +0000
Subject: Re: [KJ] Fw: Suggested janitor task - remove __init/__exit from
Message-Id: <12873.1137470212@kao2.melbourne.sgi.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17644342104704869=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060114193606.0a0a8162.rdunlap@xenotime.net>
In-Reply-To: <20060114193606.0a0a8162.rdunlap@xenotime.net>
To: kernel-janitors@vger.kernel.org

--===============17644342104704869==
Content-Type: text/plain; charset=us-ascii

Alexey Dobriyan (on Mon, 16 Jan 2006 01:24:05 +0300) wrote:
>On Sat, Jan 14, 2006 at 07:36:06PM -0800, Randy.Dunlap wrote:
>> Alexey, comments/thoughts?
>
>Thanks for ping. I saw it on l-k, I like it.
>
>> Begin forwarded message:
>>
>> Date: Sun, 15 Jan 2006 13:11:35 +1100
>> From: Keith Owens <kaos@ocs.com.au>
>> To: linux-kernel@vger.kernel.org
>> Subject: Suggested janitor task - remove __init/__exit from function prototypes
>>
>> Some function prototypes (in both .h and .c files) specify attributes
>> like __init and __exit in the prototype.  gcc (at least at 3.3.3) uses
>> the last such attribute that is actually specified, without issuing a
>> warning.  So we can have :-
>>
>> * Prototype declarations that use one attribute and a function body
>>   that uses another attribute.
>>
>> * Functions that from the .c code appear to be normal text but the .h
>>   file is silently setting a special attribute.
>
>Out of curiosity, can someone name an example?

Mismatch between prototype and body definitely exist, here is one

include/asm-ia64/smp.h:extern char no_int_routing __devinitdata;
arch/ia64/kernel/smpboot.c:char __initdata no_int_routing;

Finding functions/data with no attribute in the body but an attribute
in the prototype will take a bit more work.  Which is what we have
janitors for :)

>> Both are potential sources of programmer confusion or bugs.  I suggest
>> a janitor task to find all function prototypes that use __init, __exit,
>> __devinit, __devexit, __cpuinit or __cpuexit and remove the attribute
>> from the prototype.  If the function body does not already specify a
>> suitable attribute then add the attribute to the function body.
>>
>> The same task could be done for extern data declarations.
>
>Keith, can you clarify?

Data can be defined as __initdata, __exitdata, __nosavedata,
__initdata_or_module, __devinitdata, __devexitdata, __cpuinitdata,
__cpuexitdata.  None of those attributes should appear in .h files,
only in the .c files.

egrep -r '__initdata|__exitdata|__nosavedata|__initdata_or_module|__devinitdata|__devexitdata|__cpuinitdata|__cpuexitdata' include | egrep -v '/init\.h|/sections\.h'

>> Once that is done, remove #include <linux/init.h> from all .h files.
>
>Worth it just because of this sentence. I lost a file in a tree which
>took 3 (three) seconds to just preprocess and 10 (ten) seconds overall. No,
>it's not advansys.c.
>
>> Only .[cS] files should specify which section the data and text are
>> stored in, .h files should only define the C language information.


--===============17644342104704869==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17644342104704869==--
