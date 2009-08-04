From: Julia Lawall <julia@diku.dk>
Date: Tue, 04 Aug 2009 20:27:07 +0000
Subject: [PATCH] arch/parisc: correct use of SHF_ALLOC
Message-Id: <Pine.LNX.4.64.0908042226231.3737@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

SHF_ALLOC is suitable for testing against the sh_flags field, not the
sh_type field.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/parisc/kernel/module.c         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index ef5caf2..c904817 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -853,7 +853,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 	 * ourselves */
 	for (i = 1; i < hdr->e_shnum; i++) {
 		if(sechdrs[i].sh_type = SHT_SYMTAB
-		   && (sechdrs[i].sh_type & SHF_ALLOC)) {
+		   && (sechdrs[i].sh_flags & SHF_ALLOC)) {
 			int strindex = sechdrs[i].sh_link;
 			/* FIXME: AWFUL HACK
 			 * The cast is to drop the const from
