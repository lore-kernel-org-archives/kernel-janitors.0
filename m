From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 10 Dec 2020 18:22:00 +0000
Subject: Re: [PATCH] checkpatch: Fix "Missing a blank line after declarations" test on patches
Message-Id: <f748fbd5-f646-caa9-aec1-52ba882f9665@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201210175235.65657-1-christophe.jaillet@wanadoo.fr>
 <c0382efac23a4fb18f31974b80f25558cada7243.camel@perches.com>
In-Reply-To: <c0382efac23a4fb18f31974b80f25558cada7243.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, apw@canonical.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 10/12/2020 à 19:13, Joe Perches a écrit :
> On Thu, 2020-12-10 at 18:52 +0100, Christophe JAILLET wrote:
>> "Missing a blank line after declarations" is not triggered on patches.
> 
> That's not true.
> It does work on any patch that does a new function addition.
> There are some patch context complications here when lines are
> added and removed such that '+' add, '-' delete, and ' ' context
> testing isn't always obvious.
> 
> So, the code was intentionally limited to just new functions.
> 
> If there are simple ways to avoid false positives, great, but I
> believe it's not trivial.
> 
>> Tweak the regex to match such cases.
> 
> Please send multiple patch examples of different forms where it
> does not work.
> 
>> This patch is mostly a PoC. I don't know enough about checkpatch.pl to be
>> sure that the fix is the right thing to do.
>> At least, it works for me :)
> 
> Always a starting point...
> 
>>
>> The [\+ ] is taken from the test just above.
>>
>> I also wonder if there is a missing ^ in the last test:
>>    (($prevline =~ /[\+ ](\s+)\S/) && $sline =~ /^[\+ ]$1\S/))
>>                    ^
>>                    |___ here
> 
> 
> 
> 

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 10 Dec 2020 14:14:07 +0100

A local variable was used only within an if branch.
Thus move the definition for the variable “mm” into the corresponding
code block.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
  drivers/misc/cxl/cxllib.c | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/cxl/cxllib.c b/drivers/misc/cxl/cxllib.c
index 2a1783f32254..53b919856426 100644
--- a/drivers/misc/cxl/cxllib.c
+++ b/drivers/misc/cxl/cxllib.c
@@ -170,8 +170,6 @@ int cxllib_get_PE_attributes(struct task_struct *task,
  			     unsigned long translation_mode,
  			     struct cxllib_pe_attributes *attr)
  {
-	struct mm_struct *mm = NULL;
-
  	if (translation_mode != CXL_TRANSLATED_MODE &&
  		translation_mode != CXL_REAL_MODE)
  		return -EINVAL;
@@ -182,7 +180,7 @@ int cxllib_get_PE_attributes(struct task_struct *task,
  				true);
  	attr->lpid = mfspr(SPRN_LPID);
  	if (task) {
-		mm = get_task_mm(task);
+		struct mm_struct *mm = get_task_mm(task);
  		if (mm = NULL)
  			return -EINVAL;
  		/*
--
2.29.2
