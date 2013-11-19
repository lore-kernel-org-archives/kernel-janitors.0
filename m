From: Eddie Kovsky <ewk@edkovsky.org>
Date: Tue, 19 Nov 2013 03:57:45 +0000
Subject: [PATCH] staging: Clean up whitespace warnings in staging/winbond
Message-Id: <20131119035745.GA15796@athena>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Reduced checkpatch.pl warnings from 46 to 17
Long strings on lines over 80 characters remain untouched

Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
---
 drivers/staging/winbond/mds.c | 101 +++++++++++++++++++++++++++-----------=
----
 1 file changed, 66 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/winbond/mds.c b/drivers/staging/winbond/mds.c
index cac7720..9cea943 100644
--- a/drivers/staging/winbond/mds.c
+++ b/drivers/staging/winbond/mds.c
@@ -56,7 +56,8 @@ static void Mds_DurationSet(struct wbsoft_priv *adapter,
 			RTS_on =3D true; /* Using RTS */
 		else {
 			if (pT01->T01_modulation_type) { /* Is using OFDM */
-				if (CURRENT_PROTECT_MECHANISM) /* Is using protect */
+				/* Is using protect */
+				if (CURRENT_PROTECT_MECHANISM)
 					CTS_on =3D true; /* Using CTS */
 			}
 		}
@@ -69,9 +70,9 @@ static void Mds_DurationSet(struct wbsoft_priv *adapter,
 			 *  ACK Rate : 24 Mega bps
 			 *  ACK frame length =3D 14 bytes */
 			Duration =3D 2*DEFAULT_SIFSTIME +
-					   2*PREAMBLE_PLUS_SIGNAL_PLUS_SIGNALEXTENSION +
-					   ((BodyLen*8 + 22 + Rate*4 - 1)/(Rate*4))*Tsym +
-					   ((112 + 22 + 95)/96)*Tsym;
+				2*PREAMBLE_PLUS_SIGNAL_PLUS_SIGNALEXTENSION +
+				((BodyLen*8 + 22 + Rate*4 - 1)/(Rate*4))*Tsym +
+				((112 + 22 + 95)/96)*Tsym;
 		} else	{ /* DSSS */
 			/* CTS duration
 			 *  2 SIFS + DATA transmit time + 1 ACK
@@ -92,13 +93,15 @@ static void Mds_DurationSet(struct wbsoft_priv *adapter,
 				 * CTS Rate : 24 Mega bps
 				 * CTS frame length =3D 14 bytes */
 				Duration +=3D (DEFAULT_SIFSTIME +
-					    PREAMBLE_PLUS_SIGNAL_PLUS_SIGNALEXTENSION +
-					    ((112 + 22 + 95)/96)*Tsym);
+					PREAMBLE_PLUS_SIGNAL_PLUS_SIGNALEXTENSION +
+					((112 + 22 + 95)/96)*Tsym);
 			} else {
 				/* CTS + 1 SIFS + CTS duration
 				 * CTS Rate : ?? Mega bps
-				 * CTS frame length =3D 14 bytes */
-				if (pT01->T01_plcp_header_length) /* long preamble */
+				 * CTS frame length =3D 14 bytes
+				 */
+				/* long preamble */
+				if (pT01->T01_plcp_header_length)
 					Duration +=3D LONG_PREAMBLE_PLUS_PLCPHEADER_TIME;
 				else
 					Duration +=3D SHORT_PREAMBLE_PLUS_PLCPHEADER_TIME;
@@ -149,8 +152,8 @@ static void Mds_DurationSet(struct wbsoft_priv *adapter,
 					     + Rate-1) / Rate +
 					    DEFAULT_SIFSTIME*3);
 			}
-
-			((u16 *)buffer)[5] =3D cpu_to_le16(Duration); /* 4 USHOR for skip 8B US=
B, 2USHORT=FC + Duration */
+			/* 4 USHOR for skip 8B USB, 2USHORT=FC + Duration */
+			((u16 *)buffer)[5] =3D cpu_to_le16(Duration);
=20
 			/* ----20061009 add by anson's endian */
 			pNextT00->value =3D cpu_to_le32(pNextT00->value);
@@ -159,7 +162,8 @@ static void Mds_DurationSet(struct wbsoft_priv *adapter,
=20
 			buffer +=3D OffsetSize;
 			pT01 =3D (struct T01_descriptor *)(buffer+4);
-			if (i !=3D 1)	/* The last fragment will not have the next fragment */
+			/* The last fragment will not have the next fragment */
+			if (i !=3D 1)
 				pNextT00 =3D (struct T00_descriptor *)(buffer+OffsetSize);
 		}
=20
@@ -189,7 +193,8 @@ static void Mds_DurationSet(struct wbsoft_priv *adapter,
 		}
 	}
=20
-	((u16 *)buffer)[5] =3D cpu_to_le16(Duration); /* 4 USHOR for skip 8B USB,=
 2USHORT=FC + Duration */
+	/* 4 USHOR for skip 8B USB, 2USHORT=FC + Duration */
+	((u16 *)buffer)[5] =3D cpu_to_le16(Duration);
 	pT00->value =3D cpu_to_le32(pT00->value);
 	pT01->value =3D cpu_to_le32(pT01->value);
 	/* --end 20061009 add */
@@ -221,9 +226,10 @@ static u16 Mds_BodyCopy(struct wbsoft_priv *adapter,
 		CopySize =3D SizeLeft;
 		if (SizeLeft > pDes->FragmentThreshold) {
 			CopySize =3D pDes->FragmentThreshold;
-			pT00->T00_frame_length =3D 24 + CopySize; /* Set USB length */
-		} else
-			pT00->T00_frame_length =3D 24 + SizeLeft; /* Set USB length */
+			/* Set USB length */
+			pT00->T00_frame_length =3D 24 + CopySize;
+		} else  /* Set USB length */
+			pT00->T00_frame_length =3D 24 + SizeLeft;
=20
 		SizeLeft -=3D CopySize;
=20
@@ -267,21 +273,27 @@ static u16 Mds_BodyCopy(struct wbsoft_priv *adapter,
 		/* 931130.5.n */
 		if (pMds->MicAdd) {
 			if (!SizeLeft) {
-				pMds->MicWriteAddress[pMds->MicWriteIndex] =3D buffer - pMds->MicAdd;
-				pMds->MicWriteSize[pMds->MicWriteIndex] =3D pMds->MicAdd;
+				pMds->MicWriteAddress[pMds->MicWriteIndex] +					buffer - pMds->MicAdd;
+				pMds->MicWriteSize[pMds->MicWriteIndex] +					pMds->MicAdd;
 				pMds->MicAdd =3D 0;
 			} else if (SizeLeft < 8) { /* 931130.5.p */
 				pMds->MicAdd =3D SizeLeft;
-				pMds->MicWriteAddress[pMds->MicWriteIndex] =3D buffer - (8 - SizeLeft);
-				pMds->MicWriteSize[pMds->MicWriteIndex] =3D 8 - SizeLeft;
+				pMds->MicWriteAddress[pMds->MicWriteIndex] +					buffer - (8 - SizeLef=
t);
+				pMds->MicWriteSize[pMds->MicWriteIndex] +					8 - SizeLeft;
 				pMds->MicWriteIndex++;
 			}
 		}
=20
 		/* Does it need to generate the new header for next mpdu? */
 		if (SizeLeft) {
-			buffer =3D TargetBuffer + Size; /* Get the next 4n start address */
-			memcpy(buffer, TargetBuffer, 32); /* Copy 8B USB +24B 802.11 */
+			/* Get the next 4n start address */
+			buffer =3D TargetBuffer + Size;
+			/* Copy 8B USB +24B 802.11 */
+			memcpy(buffer, TargetBuffer, 32);
 			pT00 =3D (struct T00_descriptor *)buffer;
 			pT00->T00_first_mpdu =3D 0;
 		}
@@ -293,7 +305,8 @@ static u16 Mds_BodyCopy(struct wbsoft_priv *adapter,
 	pT00->T00_IsLastMpdu =3D 1;
 	buffer =3D (u8 *)pT00 + 8; /* +8 for USB hdr */
 	buffer[1] &=3D ~0x04; /* Clear more frag bit of 802.11 frame control */
-	pDes->FragmentCount =3D FragmentCount; /* Update the correct fragment num=
ber */
+	/* Update the correct fragment number */
+	pDes->FragmentCount =3D FragmentCount;
 	return Size;
 }
=20
@@ -330,7 +343,8 @@ static void Mds_HeaderCopy(struct wbsoft_priv *adapter,
=20
 	FragmentThreshold =3D DEFAULT_FRAGMENT_THRESHOLD;	/* Do not fragment */
 	/* Copy full data, the 1'st buffer contain all the data 931130.5.j */
-	memcpy(TargetBuffer, src_buffer, DOT_11_MAC_HEADER_SIZE); /* Copy header =
*/
+	/* Copy header */
+	memcpy(TargetBuffer, src_buffer, DOT_11_MAC_HEADER_SIZE);
 	pDes->buffer_address[0] =3D src_buffer + DOT_11_MAC_HEADER_SIZE;
 	pDes->buffer_total_size -=3D DOT_11_MAC_HEADER_SIZE;
 	pDes->buffer_size[0] =3D pDes->buffer_total_size;
@@ -358,8 +372,8 @@ static void Mds_HeaderCopy(struct wbsoft_priv *adapter,
 	for (i =3D 0; i < 2; i++) {
 		if (i =3D 1)
 			ctmp1 =3D ctmpf;
-
-		pMds->TxRate[pDes->Descriptor_ID][i] =3D ctmp1; /* backup the ta rate an=
d fall back rate */
+		/* backup the ta rate and fall back rate */
+		pMds->TxRate[pDes->Descriptor_ID][i] =3D ctmp1;
=20
 		if (ctmp1 =3D 108)
 			ctmp2 =3D 7;
@@ -395,7 +409,8 @@ static void Mds_HeaderCopy(struct wbsoft_priv *adapter,
 	/*
 	 * Set preamble type
 	 */
-	if ((pT01->T01_modulation_type =3D 0) && (pT01->T01_transmit_rate =3D 0))=
	/* RATE_1M */
+	/* RATE_1M */
+	if ((pT01->T01_modulation_type =3D 0) && (pT01->T01_transmit_rate =3D 0))
 		pDes->PreambleMode =3D  WLAN_PREAMBLE_TYPE_LONG;
 	else
 		pDes->PreambleMode =3D  CURRENT_PREAMBLE_MODE;
@@ -468,12 +483,14 @@ Mds_Tx(struct wbsoft_priv *adapter)
 	/* Start to fill the data */
 	do {
 		FillIndex =3D pMds->TxFillIndex;
-		if (pMds->TxOwner[FillIndex]) { /* Is owned by software 0:Yes 1:No */
+		/* Is owned by software 0:Yes 1:No */
+		if (pMds->TxOwner[FillIndex]) {
 			pr_debug("[Mds_Tx] Tx Owner is H/W.\n");
 			break;
 		}
=20
-		XmitBufAddress =3D pMds->pTxBuffer + (MAX_USB_TX_BUFFER * FillIndex); /*=
 Get buffer */
+		/* Get buffer */
+		XmitBufAddress =3D pMds->pTxBuffer + (MAX_USB_TX_BUFFER * FillIndex);
 		XmitBufSize =3D 0;
 		FillCount =3D 0;
 		do {
@@ -485,7 +502,8 @@ Mds_Tx(struct wbsoft_priv *adapter)
 			FragmentThreshold =3D CURRENT_FRAGMENT_THRESHOLD;
 			/* 931130.5.b */
 			FragmentCount =3D PacketSize/FragmentThreshold + 1;
-			stmp =3D PacketSize + FragmentCount*32 + 8; /* 931130.5.c 8:MIC */
+			/* 931130.5.c 8:MIC */
+			stmp =3D PacketSize + FragmentCount*32 + 8;
 			if ((XmitBufSize + stmp) >=3D MAX_USB_TX_BUFFER)
 				break; /* buffer is not enough */
=20
@@ -499,18 +517,23 @@ Mds_Tx(struct wbsoft_priv *adapter)
=20
 			TxDesIndex =3D pMds->TxDesIndex; /* Get the current ID */
 			pTxDes->Descriptor_ID =3D TxDesIndex;
-			pMds->TxDesFrom[TxDesIndex] =3D 2; /* Storing the information of source=
 coming from */
+			/* Storing the information of source coming from */
+			pMds->TxDesFrom[TxDesIndex] =3D 2;
 			pMds->TxDesIndex++;
 			pMds->TxDesIndex %=3D MAX_USB_TX_DESCRIPTOR;
=20
 			MLME_GetNextPacket(adapter, pTxDes);
=20
-			/* Copy header. 8byte USB + 24byte 802.11Hdr. Set TxRate, Preamble type=
 */
+			/*
+			 * Copy header. 8byte USB + 24byte 802.11Hdr.
+			 * Set TxRate, Preamble type
+			*/
 			Mds_HeaderCopy(adapter, pTxDes, XmitBufAddress);
=20
 			/* For speed up Key setting */
 			if (pTxDes->EapFix) {
-				pr_debug("35: EPA 4th frame detected. Size =3D %d\n", PacketSize);
+				pr_debug("35: EPA 4th frame detected. Size =3D %d\n",
+						 PacketSize);
 				pHwData->IsKeyPreSet =3D 1;
 			}
=20
@@ -524,7 +547,9 @@ Mds_Tx(struct wbsoft_priv *adapter)
 			XmitBufSize +=3D CurrentSize;
 			XmitBufAddress +=3D CurrentSize;
=20
-			/* Get packet to transmit completed, 1:TESTSTA 2:MLME 3: Ndis data */
+			/* Get packet to transmit completed,
+			 * 1:TESTSTA 2:MLME 3: Ndis data
+			*/
 			MLME_SendComplete(adapter, 0, true);
=20
 			/* Software TSC count 20060214 */
@@ -533,7 +558,12 @@ Mds_Tx(struct wbsoft_priv *adapter)
 				pMds->TxTsc_2++;
=20
 			FillCount++; /* 20060928 */
-		} while (HAL_USB_MODE_BURST(pHwData)); /* End of multiple MSDU copy loop=
. false =3D single true =3D multiple sending  */
+		/*
+		 * End of multiple MSDU copy loop.
+		 * false =3D single
+		 * true =3D multiple sending
+		 */
+		} while (HAL_USB_MODE_BURST(pHwData));
=20
 		/* Move to the next one, if necessary */
 		if (BufferFilled) {
@@ -594,7 +624,8 @@ Mds_SendComplete(struct wbsoft_priv *adapter, struct T0=
2_descriptor *pT02)
 					pHwData->tx_retry_count[RetryCount] +=3D RetryCount;
 				else
 					pHwData->tx_retry_count[7] +=3D RetryCount;
-				pr_debug("dto_tx_retry_count =3D%d\n", pHwData->dto_tx_retry_count);
+				pr_debug("dto_tx_retry_count =3D%d\n",
+						pHwData->dto_tx_retry_count);
 				MTO_SetTxCount(adapter, TxRate, RetryCount);
 			}
 			pHwData->dto_tx_frag_count +=3D (RetryCount+1);
--=20
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
