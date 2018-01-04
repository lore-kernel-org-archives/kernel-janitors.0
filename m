From: Ravi Kumar <ravindtb@gmail.com>
Date: Thu, 04 Jan 2018 18:38:41 +0000
Subject: [PATCH] ia64:aml_nfw: Improve size determination in one function
Message-Id: <CAF4DfF_CrDtifHDU3vEhzttriPvEbNzGjwjD4QV=_EsBLLQsVw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Replace the data structure type by variable reference as parameter of
the operators "sizeof" and "offsetof" to make the size determination a
bit safer according to the Linux coding style convention.

Signed-off-by: Ravi Kumar <ravindtb@gmail.com,rakumar8@in.ibm.com>

--- aml_nfw.c    2018-01-04 23:09:44.132262000 +0530
+++ linux-4.14.10/arch/ia64/hp/common/aml_nfw.c    2017-12-29
22:23:50.000000000 +0530
@@ -123,12 +123,12 @@
         bit_width != 32 && bit_width != 64)
         return AE_BAD_PARAMETER;

-    if (address + (bit_width >> 3) > sizeof(*context))
+    if (address + (bit_width >> 3) > sizeof(struct ia64_nfw_context))
         return AE_BAD_PARAMETER;

     switch (function) {
     case ACPI_READ:
-        if (address = offsetof(*context, ret))
+        if (address = offsetof(struct ia64_nfw_context, ret))
             aml_nfw_execute(context);
         aml_nfw_read_arg(offset, bit_width, value);
         break;
