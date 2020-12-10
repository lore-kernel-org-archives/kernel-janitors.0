From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 10 Dec 2020 18:01:36 +0000
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_cxl=3a_Reduce_scope_for_the_variable_?= =?UTF-8?B?4oCcbW3igJ0gaW4gY3hsbG
Message-Id: <6da89e4e-1f29-0dde-ad5b-a168f4cc1e85@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5cee2b25-71e0-15aa-fba6-12211b8308aa@web.de>
 <X9I1GLYCkw/q/xMu@kroah.com> <507d607a-0551-ec11-e1dc-5b9c96a361cb@web.de>
In-Reply-To: <507d607a-0551-ec11-e1dc-5b9c96a361cb@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Le 10/12/2020 à 17:04, Markus Elfring a écrit :
>>> A local variable was used only within an if branch.
>>> Thus move the definition for the variable “mm” into the corresponding
>>> code block.
>>
>> You did nothing here except add a checkpatch warning :(
> 
> elfring@Sonne:~/Projekte/Linux/next-patched> scripts/checkpatch.pl /home/elfring/Projekte/Bau/Linux/scripts/Coccinelle/tuning1/next/20201204/Flicken/0001-cxl-Reduce-scope-for-the-variable-mm-in-cxllib_get_P.patch
> total: 0 errors, 0 warnings, 16 lines checked
> 
> Regards,
> Markus
> 

Maybe:
    script/checkpatch.pl -f drivers/misc/cxl/cxllib.c

?
