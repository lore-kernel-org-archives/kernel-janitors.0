From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Jan 2016 15:12:27 +0000
Subject: net-rsi: Reconsider usage of variable "vap_id" in rsi_send_mgmt_pkt()
Message-Id: <5687E8DB.3080706@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5687E169.4070704@users.sourceforge.net>
 <5687E203.1070404@users.sourceforge.net>
In-Reply-To: <5687E203.1070404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Hello,

I have taken another look at the implementation of the function "rsi_send_m=
gmt_pkt".
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/drive=
rs/net/wireless/rsi/rsi_91x_pkt.c?id=E8c58e7a5a106c3d557fccd01cd4d1128f9bab=
38#n114

I find the following statement combination interesting there.

=E2=80=A6
	u8 vap_id =3D 0;
=E2=80=A6
	msg[7] |=3D cpu_to_le16(vap_id << 8);
=E2=80=A6

I would appreciate a further clarification.
Does a shift operation for a variable which contains zero indicate an open =
issue?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
