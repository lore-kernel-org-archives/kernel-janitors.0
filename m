From: "tom hisch" <t.hisch@gmail.com>
Date: Fri, 07 Jul 2006 17:44:50 +0000
Subject: [KJ] [Patch] acpi: remove unnecassary check of acpi_ac_dir_param in
Message-Id: <8ef77f2e0607071044u64f2cf23pa22846e77f0fc3af@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_Part_40909_26612986.1152294290972"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

------=_Part_40909_26612986.1152294290972
Content-Type: multipart/alternative;
    boundary="----------=_1152294327-28834-80"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1152294327-28834-80
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

thank you for all your tips!

2nd try:
this patch is against 2.6.18-rc1

it removes an unnecassary check of acpi_ac_dir_param.

it compiles clean on x86 with the applied patch but I do not have a smart
battery to test it.

tabs don't work in the gmail compose mail window so i have attached the
patch. any ideas how to send patches with gmail ??
now everything ok ?

Signed-off-by: Tom Hisch <t.hisch@gmail.com>

------------=_1152294327-28834-80
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

thank you for all your tips!<br><div><br>2nd try:<br>this patch is against 2.6.18-rc1<br><br>it removes an unnecassary check of acpi_ac_dir_param. <br><br>it compiles clean<span DEFANGED_style="font-family: monospace;"> </span>on x86 with the applied patch but I do not have a smart battery to test it.
<br><br>tabs don't work in the gmail compose mail window so i have attached the patch. any ideas how to send patches with gmail ??<br>now everything ok ?<br><br>Signed-off-by: Tom Hisch &lt;<a href="mailto:t.hisch@gmail.com" target="_blank" DEFANGED_onclick="return top.js.OpenExtLink(window,event,this)">
t.hisch@gmail.com</a>&gt;<br><br><br></div>

------------=_1152294327-28834-80--

------=_Part_40909_26612986.1152294290972
Content-Type: text/x-patch; name=myfirstpatch.diff; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_epcu7zmc
Content-Disposition: attachment; filename="myfirstpatch.diff"

LS0tIGxpbnV4LTIuNi9kcml2ZXJzL2FjcGkvY21fc2JzLmMub3JpZwkyMDA2
LTA3LTA2IDIzOjU0OjA0LjAwMDAwMDAwMCArMDIwMAorKysgbGludXgtMi42
L2RyaXZlcnMvYWNwaS9jbV9zYnMuYwkyMDA2LTA3LTA3IDE1OjA3OjU3LjAw
MDAwMDAwMCArMDIwMApAQCAtNjksMTAgKzY5LDEwIEBAIHZvaWQgYWNwaV91
bmxvY2tfYWNfZGlyKHN0cnVjdCBwcm9jX2Rpcl8KIAlkb3duKCZjbV9zYnNf
c2VtKTsKIAlpZiAoYWNwaV9hY19kaXJfcGFyYW0pIHsKIAkJbG9ja19hY19k
aXJfY250LS07Ci0JfQotCWlmIChsb2NrX2FjX2Rpcl9jbnQgPT0gMCAmJiBh
Y3BpX2FjX2Rpcl9wYXJhbSAmJiBhY3BpX2FjX2RpcikgewotCQlyZW1vdmVf
cHJvY19lbnRyeShBQ1BJX0FDX0NMQVNTLCBhY3BpX3Jvb3RfZGlyKTsKLQkJ
YWNwaV9hY19kaXIgPSAwOworCQlpZiAobG9ja19hY19kaXJfY250ID09IDAg
JiYgYWNwaV9hY19kaXIpIHsKKwkJCXJlbW92ZV9wcm9jX2VudHJ5KEFDUElf
QUNfQ0xBU1MsIGFjcGlfcm9vdF9kaXIpOworCQkJYWNwaV9hY19kaXIgPSAw
OworCQl9CiAJfQogCXVwKCZjbV9zYnNfc2VtKTsKIH0K

------=_Part_40909_26612986.1152294290972
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

------=_Part_40909_26612986.1152294290972--
