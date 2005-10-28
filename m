From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 28 Oct 2005 14:39:50 +0000
Subject: [KJ] 2.6.14-kj1
Message-Id: <20051028143950.GA27655@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97551870763638604=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org

--===============97551870763638604==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2.6.14-kj1 patchset is out. You can get it from
http://coderock.org/kj/2.6.14-kj1/

New in this release
-------------------
-hexdigits_definition_consolidation.patch
+hex_digits_consolidation.patch

	New version of hex digits consolidation from Masoud Sharbiani.
	Is	+EXPORT_SYMBOL(small_digits);
		+EXPORT_SYMBOL(large_digits);	OK?

+drivers_atm_firestream_c_convert_interruptible_sleep_on.patch
+drivers_atm_nicstar_c_replace_interruptible_sleep_on_timeout.patch
+drivers_block_swim3_c_replace_interruptible_sleep_on.patch
+drivers_block_swim_iop_c_replace_interruptible_sleep_on.patch
+drivers_char_amiserial_c_replace_interruptible_sleep_on.patch
+drivers_char_cyclades_c_replace_interruptible_sleep_on.patch
+drivers_char_epca_c_replace_interruptible_sleep_on.patch
+drivers_char_esp_c_replace_interruptible_sleep_on.patch
+drivers_char_generic_serial_c_replace_interruptible_sleep_on.patch
+drivers_char_isicom_c_replace_interruptible_sleep_on.patch
+drivers_char_istallion_c_replace_interruptible_sleep_on.patch
+drivers_char_moxa_c_replace_interruptible_sleep_on.patch
+drivers_char_pcmcia_synclink_cs_c_replace_interruptible_sleep_on.patch
+drivers_char_riscom8_c_replace_interruptible_sleep_on.patch
+drivers_char_rocket_c_replace_interruptible_sleep_on.patch
+drivers_char_serial167_c_replace_interruptible_sleep_on.patch
+drivers_char_specialix_c_replace_interruptible_sleep_on.patch
+drivers_char_stallion_c_replace_interruptible_sleep_on.patch
+drivers_char_synclink_c_replace_interruptible_sleep_on.patch
+drivers_char_synclinkmp_c_replace_interruptible_sleep_on.patch
+drivers_isdn_i4l_isdn_tty_c_replace_interruptible_sleep_on.patch
+drivers_media_radio_radio_cadet_c_replace_interruptible_sleep_on.patch

	Irwan Djajadi continues Nishanth Aravamudan's quest of getting
	rid of *sleep_on* functions. Needs review, review, review...


--===============97551870763638604==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97551870763638604==--
