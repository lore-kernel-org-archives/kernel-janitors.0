From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 Sep 2014 13:25:45 +0000
Subject: re: bonding: clean up style for bond_3ad.c
Message-Id: <20140916132545.GA1059@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

[ This isn't really the patch that introduced the bug.  I'm not sure
  why Smatch is only complaining about this now.  Anyway, it looks
  buggy.  -dan ]

Hello Veaceslav Falico,

This is a semi-automatic email about new static checker warnings.

The patch 3bf2d28a2d71: "bonding: clean up style for bond_3ad.c" from=20
Jan 8, 2014, leads to the following Smatch complaint:

drivers/net/bonding/bond_3ad.c:1346 ad_port_selection_logic()
	 error: we previously assumed 'port->aggregator' could be null (see line 1=
211)

drivers/net/bonding/bond_3ad.c
  1210		/* if the port is connected to other aggregator, detach it */
  1211		if (port->aggregator) {
                    ^^^^^^^^^^^^^^^^
Here.

  1212			/* detach the port from its former aggregator */
  1213			temp_aggregator =3D port->aggregator;
  1214			for (curr_port =3D temp_aggregator->lag_ports; curr_port;
  1215			     last_port =3D curr_port,
  1216			     curr_port =3D curr_port->next_port_in_aggregator) {
  1217				if (curr_port =3D port) {
  1218					temp_aggregator->num_of_ports--;
  1219					/* if it is the first port attached to the
  1220					 * aggregator
  1221					 */
  1222					if (!last_port) {
  1223						temp_aggregator->lag_ports   1224							port->next_port_in_aggr=
egator;
  1225					} else {
  1226						/* not the first port attached to the
  1227						 * aggregator
  1228						 */
  1229						last_port->next_port_in_aggregator   1230							port->next_port=
_in_aggregator;
  1231					}
  1232=09
  1233					/* clear the port's relations to this
  1234					 * aggregator
  1235					 */
  1236					port->aggregator =3D NULL;
  1237					port->next_port_in_aggregator =3D NULL;
  1238					port->actor_port_aggregator_identifier =3D 0;
  1239=09
  1240					netdev_dbg(bond->dev, "Port %d left LAG %d\n",
  1241						   port->actor_port_number,
  1242						   temp_aggregator->aggregator_identifier);
  1243					/* if the aggregator is empty, clear its
  1244					 * parameters, and set it ready to be attached
  1245					 */
  1246					if (!temp_aggregator->lag_ports)
  1247						ad_clear_agg(temp_aggregator);
  1248					break;
  1249				}
  1250			}
  1251			if (!curr_port) {
  1252				/* meaning: the port was related to an aggregator
  1253				 * but was not on the aggregator port list
  1254				 */
  1255				net_warn_ratelimited("%s: Warning: Port %d (on %s) was related to=
 aggregator %d but was not on its port list\n",
  1256						     port->slave->bond->dev->name,
  1257						     port->actor_port_number,
  1258						     port->slave->dev->name,
  1259						     port->aggregator->aggregator_identifier);
  1260			}
  1261		}
  1262		/* search on all aggregators for a suitable aggregator for this por=
t */
  1263		bond_for_each_slave(bond, slave, iter) {
  1264			aggregator =3D &(SLAVE_AD_INFO(slave)->aggregator);
  1265=09
  1266			/* keep a free aggregator for later use(if needed) */
  1267			if (!aggregator->lag_ports) {
  1268				if (!free_aggregator)
  1269					free_aggregator =3D aggregator;
  1270				continue;
  1271			}
  1272			/* check if current aggregator suits us */
  1273			if (((aggregator->actor_oper_aggregator_key =3D port->actor_oper_p=
ort_key) && /* if all parameters match AND */
  1274			     MAC_ADDRESS_EQUAL(&(aggregator->partner_system), &(port->part=
ner_oper.system)) &&
  1275			     (aggregator->partner_system_priority =3D port->partner_oper.s=
ystem_priority) &&
  1276			     (aggregator->partner_oper_aggregator_key =3D port->partner_op=
er.key)
  1277			    ) &&
  1278			    ((!MAC_ADDRESS_EQUAL(&(port->partner_oper.system), &(null_mac_=
addr)) && /* partner answers */
  1279			      !aggregator->is_individual)  /* but is not individual OR */
  1280			    )
  1281			   ) {
  1282				/* attach to the founded aggregator */
  1283				port->aggregator =3D aggregator;
  1284				port->actor_port_aggregator_identifier   1285					port->aggregato=
r->aggregator_identifier;
  1286				port->next_port_in_aggregator =3D aggregator->lag_ports;
  1287				port->aggregator->num_of_ports++;
  1288				aggregator->lag_ports =3D port;
  1289				netdev_dbg(bond->dev, "Port %d joined LAG %d(existing LAG)\n",
  1290					   port->actor_port_number,
  1291					   port->aggregator->aggregator_identifier);
  1292=09
  1293				/* mark this port as selected */
  1294				port->sm_vars |=3D AD_PORT_SELECTED;
  1295				found =3D 1;
  1296				break;
  1297			}
  1298		}
  1299=09
  1300		/* the port couldn't find an aggregator - attach it to a new
  1301		 * aggregator
  1302		 */
  1303		if (!found) {
  1304			if (free_aggregator) {
  1305				/* assign port a new aggregator */
  1306				port->aggregator =3D free_aggregator;
  1307				port->actor_port_aggregator_identifier   1308					port->aggregato=
r->aggregator_identifier;
  1309=09
  1310				/* update the new aggregator's parameters
  1311				 * if port was responsed from the end-user
  1312				 */
  1313				if (port->actor_oper_port_key & AD_DUPLEX_KEY_BITS)
  1314					/* if port is full duplex */
  1315					port->aggregator->is_individual =3D false;
  1316				else
  1317					port->aggregator->is_individual =3D true;
  1318=09
  1319				port->aggregator->actor_admin_aggregator_key =3D port->actor_admi=
n_port_key;
  1320				port->aggregator->actor_oper_aggregator_key =3D port->actor_oper_=
port_key;
  1321				port->aggregator->partner_system   1322					port->partner_oper.sy=
stem;
  1323				port->aggregator->partner_system_priority   1324					port->partne=
r_oper.system_priority;
  1325				port->aggregator->partner_oper_aggregator_key =3D port->partner_o=
per.key;
  1326				port->aggregator->receive_state =3D 1;
  1327				port->aggregator->transmit_state =3D 1;
  1328				port->aggregator->lag_ports =3D port;
  1329				port->aggregator->num_of_ports++;
  1330=09
  1331				/* mark this port as selected */
  1332				port->sm_vars |=3D AD_PORT_SELECTED;
  1333=09
  1334				netdev_dbg(bond->dev, "Port %d joined LAG %d(new LAG)\n",
  1335					   port->actor_port_number,
  1336					   port->aggregator->aggregator_identifier);
  1337			} else {
  1338				netdev_err(bond->dev, "Port %d (on %s) did not find a suitable ag=
gregator\n",
                                                       ^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Uh, oh.  We totally failed to find a good port->aggretator.

  1339				       port->actor_port_number, port->slave->dev->name);
  1340			}
  1341		}
  1342		/* if all aggregator's ports are READY_N =3D TRUE, set ready=3DTRUE
  1343		 * in all aggregator's ports, else set ready=FALSE in all
  1344		 * aggregator's ports
  1345		 */
  1346		__set_agg_ports_ready(port->aggregator,
                                      ^^^^^^^^^^^^^^^^
We dereference the NULL inside the call to __set_agg_ports_ready().

  1347				      __agg_ports_are_ready(port->aggregator));
  1348=09

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
