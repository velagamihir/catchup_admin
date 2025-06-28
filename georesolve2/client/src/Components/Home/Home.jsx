import React from "react";
import Button from "@mui/material/Button";
import Menu from "@mui/material/Menu";
import MenuIcon from "@mui/icons-material/Menu";
import MenuItem from "@mui/material/MenuItem";
import { useNavigate } from "react-router-dom";
import { Parallax } from "react-scroll-parallax";

const Home = () => {
  const navigate = useNavigate();
  const [anchorEl, setAnchorEl] = React.useState(null);
  const open = Boolean(anchorEl);

  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };
  const handleClose = () => {
    setAnchorEl(null);
  };

  return (
    <div className="h-dvh w-dvw">
      {/* Navbar */}
      <nav className="h-16 bg-[#211A4D] flex items-center justify-between w-dvw">
        <div className="flex items-center">
          <Button
            id="basic-button"
            aria-controls={open ? "basic-menu" : undefined}
            aria-haspopup="true"
            aria-expanded={open ? "true" : undefined}
            onClick={handleClick}
          >
            <MenuIcon />
          </Button>
          <Menu
            id="basic-menu"
            anchorEl={anchorEl}
            open={open}
            onClose={handleClose}
            slotProps={{
              list: {
                "aria-labelledby": "basic-button",
              },
            }}
          >
            <MenuItem onClick={handleClose}>About Us</MenuItem>
            <MenuItem onClick={handleClose}>Search Related Officer</MenuItem>
            <MenuItem onClick={handleClose}>Policies</MenuItem>
          </Menu>
          <div className="h-16 flex items-center ms-3">
            <img src="./favicon.png" alt="logo" className="h-full" />
            <p className="text-white text-4xl ml-2">GeoResolve</p>
          </div>
        </div>
        <div className="me-5 pr-5">
          <Button
            onClick={() => navigate("/login")}
            variant="contained"
            sx={{
              backgroundColor: "#2282ce",
              "&:hover": { backgroundColor: "#165a91" },
            }}
          >
            signup/login
          </Button>
        </div>
      </nav>

      {/* Parallax Hero Section */}
      <div
        className="h-[80vh] bg-fixed bg-center bg-cover flex items-center justify-center"
        style={{
          backgroundImage: "url('/favicon.png')",
        }}
      >
        <h1 className="text-white text-5xl font-bold bg-black/40 px-6 py-3 rounded-xl">
          Welcome to GeoResolve
        </h1>
      </div>

      <div className="bg-white p-10">
        <Parallax speed={-10}>
          <div className="text-lg leading-relaxed max-w-5xl mx-auto text-black">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint,
            itaque amet dolore dicta eaque fugiat temporibus explicabo corrupti
            eum repellat. Quasi quia culpa tempora labore voluptatem, laboriosam
            autem ab tempore? Porro pariatur magni eius adipisci ab? Beatae
            reiciendis eligendi consequuntur rem distinctio culpa laboriosam
            incidunt...
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Similique suscipit, autem commodi error dolorem hic tenetur voluptate molestiae. Ut laboriosam ratione aspernatur placeat voluptas eaque laudantium beatae sed nulla nesciunt!
            Eius autem ea maxime animi alias maiores possimus omnis. Ad minima eos cumque beatae? Sunt non quas officia voluptatem doloribus eos minus eius tenetur dignissimos at. Beatae doloribus animi ipsam!
            Adipisci porro error reprehenderit quibusdam nihil fugit, temporibus vitae quo incidunt laborum et harum ratione. Saepe, eligendi, incidunt quis quos molestiae fuga eos, ipsum excepturi similique modi quasi veniam nobis?
            Mollitia adipisci minus delectus cumque unde commodi non labore maxime omnis iure excepturi reprehenderit dicta modi, natus dolore! Modi perspiciatis assumenda earum voluptas sapiente fugit, velit provident maiores ab omnis?
            Dolorem nostrum explicabo enim ea quibusdam aspernatur dolore non consequuntur sapiente quos distinctio corporis sunt, iure odit excepturi soluta, vitae nisi? Dicta aspernatur odio dignissimos enim harum asperiores impedit culpa?
            Repudiandae eligendi sequi harum numquam aliquid eaque vero architecto est blanditiis aspernatur. Deserunt odio culpa mollitia quisquam enim delectus nostrum, inventore officiis cumque quasi vero officia non voluptatem quas facilis?
            Quae eligendi ratione consectetur praesentium optio facilis voluptas maxime recusandae nobis ipsam perferendis fugiat beatae unde, nihil sint repellendus voluptatem veniam perspiciatis sed possimus! Doloremque iure dolore et amet dignissimos.
            Quisquam, obcaecati consectetur beatae corrupti doloremque dolores, perspiciatis molestiae repudiandae excepturi, veritatis harum quod aut. Numquam inventore reiciendis blanditiis veniam obcaecati accusamus, praesentium ipsam quae incidunt, aliquid voluptatem tempora excepturi?
            Asperiores non eligendi eum corrupti laudantium totam excepturi ipsum a minima quasi obcaecati itaque quo optio, nobis tempora et deserunt facere delectus quisquam exercitationem cumque. Dolorem totam atque amet in.
            Modi reiciendis atque autem minima sint dolor quaerat ut similique, corporis aspernatur explicabo veritatis distinctio reprehenderit, quis qui possimus! Minima laboriosam quibusdam iusto placeat officiis soluta assumenda ut officia deleniti.
            Perspiciatis quam, dolor architecto debitis inventore quia quasi, maxime laborum praesentium qui, veritatis dolorem minima. Laudantium distinctio iusto consequatur repudiandae. Quam consequatur delectus voluptatem provident praesentium repudiandae quisquam optio enim.
            Dicta minus quo laudantium alias doloribus laboriosam blanditiis eum in. Molestiae, modi quidem. Temporibus, laboriosam accusamus maxime aliquid sed recusandae commodi obcaecati tempore est quam magnam neque! Ex, alias temporibus.
            Cum rerum ut repudiandae temporibus quam, aspernatur vero eos velit totam explicabo illo praesentium similique beatae saepe cupiditate, recusandae, quas laborum! Rerum hic quia ullam quasi voluptas sint officia aliquam.
            Libero maxime quo magni quas ipsa consequatur ipsam quod soluta totam deleniti repellendus, voluptatem adipisci eveniet iusto ad optio minus deserunt tenetur numquam at unde! Praesentium, at consequatur? Recusandae, a?
            Iusto facere modi sequi! Ipsum praesentium facere iure corrupti ea alias non officiis illo ratione maxime libero numquam ab aperiam voluptas, incidunt nemo illum quibusdam maiores a saepe, recusandae exercitationem.
            Rem placeat repudiandae quos voluptate provident saepe assumenda laboriosam modi animi, harum id porro repellat. Facere modi dolores accusantium illo debitis nulla odio nesciunt quidem cupiditate, veritatis quod omnis error.
            Ipsam iure neque expedita esse, reprehenderit placeat quidem blanditiis incidunt reiciendis! Quae consequuntur porro voluptatibus eveniet exercitationem, quaerat aut impedit nam tenetur, ducimus aperiam saepe maxime omnis voluptatem pariatur molestiae.
            Enim, nostrum natus tempora nesciunt ipsam sapiente, sed obcaecati modi consequuntur ipsa, sequi iusto excepturi rerum. Maxime voluptatum ratione quae, quisquam vero cum aliquid cupiditate odit quasi, libero repudiandae harum.
            Atque, cumque sequi doloremque maiores quaerat corporis autem est tenetur minima praesentium ullam. Recusandae tempore laborum dignissimos culpa sit quidem quas earum, fugit id modi consequuntur expedita error labore voluptas?
            Molestias ipsam cupiditate incidunt illum officiis perferendis est cumque nihil magnam tenetur voluptatem harum libero fugiat laborum, laboriosam ad nemo dolore rerum aliquid saepe totam ipsum. Quos minus explicabo ab.
            Ea magnam laboriosam placeat deserunt, eaque perferendis. Qui dignissimos nemo odio explicabo enim necessitatibus debitis vero eveniet aliquam error placeat, doloremque consequatur accusamus ex voluptate numquam reprehenderit nobis. Dignissimos, inventore.
            Possimus quos eos debitis mollitia blanditiis doloremque modi id amet pariatur. Molestiae deserunt excepturi odio exercitationem officia rerum explicabo, sequi blanditiis maxime, distinctio molestias optio veritatis tempora dolorum quos. Doloremque?
            Possimus quam quasi fuga reiciendis tempore, ullam consequuntur distinctio voluptas error facere, esse blanditiis accusamus minima? Doloremque, enim, temporibus aut necessitatibus nulla ducimus quis repudiandae, ipsam pariatur cupiditate exercitationem unde!
            Nulla, non, ullam totam odio nostrum facilis inventore officia iusto maxime consequatur doloribus! Quas quam, explicabo quo velit enim autem totam blanditiis tempora voluptatibus voluptas dolorem praesentium ducimus rerum sapiente.
            Architecto illo accusamus corporis nemo animi libero delectus, quasi facilis quod dolor neque cum quas repellendus ullam earum quisquam nostrum hic, magni recusandae quia repellat voluptates ratione. Obcaecati, nostrum tempore!
            Aliquid illum odit facilis, consequuntur quasi reiciendis esse dolor, asperiores, est officia hic obcaecati nostrum. Fugit saepe odio suscipit perferendis, cum voluptatibus numquam aut architecto quod maiores commodi ab veritatis?
            Cupiditate maxime tenetur alias velit ipsam quas suscipit a unde? Labore ipsa numquam molestiae culpa iusto, omnis natus praesentium ut fuga autem, recusandae neque molestias. Sapiente, quis pariatur! Eveniet, molestias!
            Consequuntur eveniet omnis consectetur veniam corporis fugiat, harum similique laboriosam adipisci excepturi quod sit, unde minima ab earum quo commodi dolorum tenetur ex repellat iusto provident. Repellat sint dolorum et?
            Beatae error neque nisi? Sequi quae rerum animi excepturi autem perferendis quasi doloremque voluptate harum eveniet dicta illo est delectus quod tempore officiis, molestias ipsam. Laudantium harum illo nisi obcaecati.
            Dicta tempore neque quas odio nulla magnam rerum, saepe, fugiat obcaecati amet ipsam eveniet fuga autem. Recusandae quo, maiores ipsa nam magnam velit aliquid totam consequuntur earum perspiciatis a quibusdam.
            Nulla reprehenderit nostrum iste, optio tempore ipsam veniam fugit, ratione dolor autem architecto mollitia harum vitae, nam itaque porro placeat? Nobis vel aut atque possimus molestias ipsam praesentium, assumenda sunt?
            Dolor tempore labore illum quisquam ab. Tempora sequi quibusdam delectus? Ullam sint magni natus quisquam omnis vel assumenda nihil voluptatibus ipsa voluptate tempore libero dolores tempora odio, nemo quod voluptas.
            Dolorem veritatis explicabo illum quod quia nam, facilis quas illo voluptates nisi ratione repudiandae harum numquam aliquid quibusdam nobis facere, perferendis rem, voluptate nulla recusandae! In, debitis alias? Sit, consequatur!
            Nemo ipsam fugiat eius voluptas minus cumque veritatis, suscipit illum perferendis voluptatum nulla debitis ea. Impedit atque deleniti, blanditiis ipsum omnis similique, neque dicta quaerat voluptatibus, fuga ut ad maxime!
            Unde modi similique omnis possimus consequuntur eaque. Asperiores quibusdam qui vel, eligendi minus odio neque rem repudiandae illum. Quidem, officiis! Rerum natus sapiente placeat praesentium error accusamus ipsam voluptatibus harum.
            Saepe dignissimos modi id est distinctio esse corporis voluptate minima possimus impedit quisquam harum sunt nostrum, amet dolorum deleniti at maiores expedita blanditiis necessitatibus sapiente? Inventore iste voluptas quisquam tempore.
            Quam libero quae explicabo modi, quis cum consectetur qui sequi. Enim asperiores officiis esse ullam quaerat quia aliquid accusantium? Cupiditate assumenda et enim eligendi unde deserunt sunt ipsam nobis veniam.
            Quae error labore illo pariatur exercitationem quisquam consectetur ad obcaecati cum consequuntur nihil architecto at eveniet laudantium debitis id suscipit tempore sed praesentium, perspiciatis minima sit? Pariatur sint aliquid debitis!
            Magnam quod perferendis cupiditate, commodi velit corporis neque voluptates libero autem quo doloribus consequatur quis labore odio quam sequi accusantium tempora! Accusamus itaque repellat aperiam earum corrupti perferendis quis a.
            Numquam iste enim adipisci qui, modi sit fuga at ad magni ab eum unde quae omnis sequi porro libero tenetur? Facilis animi sint reprehenderit sed. Corrupti quae ipsa quis maiores?
            Eos, aperiam esse. Iusto, eligendi, quod, quaerat cum voluptas rem tempore facere ex impedit nostrum unde labore porro ipsum eum. Placeat facere eveniet ipsam dolor iste labore quae vero omnis!
            Aliquam possimus tenetur ipsam provident molestias. Sunt provident harum hic! A dolores cupiditate quaerat error dolorem soluta, eos, perferendis ducimus aut amet necessitatibus dolorum temporibus aliquam libero molestias earum tenetur.
            Voluptate temporibus, totam tempore animi, asperiores natus, laboriosam praesentium accusantium rerum laudantium fuga quas magni eos est! At quos maxime maiores? Necessitatibus repudiandae deleniti illo eos animi, eius quasi tempora?
            Modi nesciunt, velit dolorum ut ducimus, repellendus dicta maxime fugiat quisquam at necessitatibus neque dolores molestiae fuga non. Dicta recusandae quos molestiae omnis ducimus praesentium ipsam perspiciatis enim. Saepe, perspiciatis!
            Perspiciatis libero, fuga voluptate dolores tempore magni animi voluptas consequatur molestiae voluptates rerum voluptatem, id totam cumque! Aut, recusandae qui. Possimus reprehenderit porro eaque unde voluptatibus sunt suscipit sapiente. Cum?
            Tenetur harum esse pariatur accusamus animi, sequi aspernatur delectus ad dicta consequuntur reiciendis dolorem odio eos cum repellat dignissimos optio nobis. Sint similique perspiciatis assumenda, facere quas modi voluptas tempore.
            Facilis assumenda dolor aliquid totam cupiditate in ab, vitae omnis porro ad ipsam quasi doloribus nisi aspernatur similique pariatur vero ipsum accusamus optio esse? Vel earum magnam quos harum accusamus.
            Voluptatibus sint hic expedita esse quam voluptate quae dolore necessitatibus aliquam provident natus maxime eius deserunt, delectus earum fugit. Delectus vero eveniet molestias id ex soluta et eum nostrum voluptatibus?
            Cum labore autem animi eaque. Tempore explicabo architecto nam soluta esse assumenda ad. Molestias atque minus quod ad tempora laborum maxime explicabo vitae dolores in iure, impedit velit, dignissimos distinctio?
            Nostrum doloribus quidem dolorem velit, porro mollitia deserunt! Mollitia in esse magnam voluptates! Nisi sit suscipit ipsa iste reprehenderit voluptates voluptas perspiciatis culpa illum, quia inventore deleniti quasi eum labore.
            Optio nobis aperiam reprehenderit, tempore id repudiandae aliquid, saepe libero ea magnam consequuntur! Quisquam aliquam repudiandae, eveniet minus error hic, maiores similique ex eligendi rerum aut asperiores vero, unde ab!
            Facilis iure placeat, ullam, ipsa laboriosam voluptas cumque, natus consequatur repellat ratione dolor perferendis animi adipisci a. Impedit suscipit ipsam illum labore numquam doloribus explicabo, totam, voluptas esse id hic.
            Odit, voluptate et? Necessitatibus beatae illum, similique voluptas incidunt illo recusandae veniam totam nisi architecto nulla odit consequuntur quis facere earum. Illo consequuntur mollitia, facilis doloribus soluta quidem exercitationem debitis.
            Impedit eum dignissimos corrupti laborum dicta, omnis voluptas nisi accusamus natus sequi recusandae fugit accusantium, facere, laboriosam pariatur incidunt ex quis velit laudantium aperiam commodi. Repellendus consequatur provident laudantium minus?
            Minus quibusdam cumque, odio error sint ratione consectetur nisi aliquam deserunt provident dolore dolor facere dignissimos ipsum. Aliquid quisquam itaque voluptatum explicabo quas debitis assumenda. Earum dolores vero expedita praesentium!
            Pariatur magnam reiciendis, culpa, saepe quia quasi, placeat ratione eos ad quis assumenda! Vero, cupiditate voluptatibus amet at cumque veniam nemo. Totam exercitationem ab voluptates veritatis pariatur. In, provident voluptate.
            Nulla quas perferendis expedita voluptas minima ipsum sit beatae velit necessitatibus, similique dolor. Ipsum fuga nulla quia earum odit sequi ipsa vel eaque officia, eligendi facere, beatae cupiditate fugiat labore.
            Ipsum iure quaerat ipsa soluta voluptatem unde dignissimos illum adipisci, esse nam quis nostrum eum ratione tempora debitis delectus sunt molestiae accusantium. Delectus porro eius quibusdam quos aut? Excepturi, facere.
            Culpa, eius facere, dolor sequi dolorem ipsum tempora consectetur quisquam illo quibusdam ea ratione iusto ut consequuntur rerum animi iure. Labore dicta recusandae inventore accusantium. Molestiae minima inventore aspernatur autem.
            Rerum quae esse ratione. Possimus non deserunt rem eius quis! Earum modi id odit nostrum adipisci laudantium, magnam sed quia facilis facere tenetur quam qui sit eius incidunt? Iusto, molestias!
            Corporis placeat reprehenderit eaque, harum eligendi laboriosam nesciunt sequi fugit tempora, doloremque aliquam quia nemo dolor quo. Adipisci repellendus recusandae eius tempora dolorem quo, veritatis illo. At facere maiores praesentium.
            Unde architecto similique accusantium eveniet commodi repudiandae possimus eos consequatur consequuntur aperiam veniam officiis aliquid, ducimus minus. Voluptatum voluptatibus debitis saepe ipsam sit culpa tenetur rerum sunt, eveniet ipsa hic?
            Maxime, sint reprehenderit. Autem nobis odit sunt, consequatur ad quasi explicabo beatae iure error sint labore blanditiis consequuntur vel facere vero, aperiam tempora deleniti voluptates qui laborum nihil dolores! Labore?
            Eaque perspiciatis expedita necessitatibus, ullam rem, maiores odit tempore optio quasi delectus natus sed saepe voluptate, dolore eum eligendi explicabo? Explicabo, quae. Eius, aliquid repellendus eos voluptate dicta sequi sapiente.
            Eos et facere quibusdam sapiente, quas sint dolorem doloribus veniam adipisci. A similique quae id reiciendis amet consectetur, sequi laborum harum eius! Perferendis, dolores at. Nobis cupiditate adipisci et repudiandae.
            Qui aspernatur quasi eligendi nesciunt. Vitae dolorum maxime aliquid debitis dignissimos nesciunt neque, doloribus similique nemo deserunt sit dolore laudantium distinctio, ipsa amet tempore! Voluptatem accusamus itaque voluptatibus suscipit consectetur.
            Iure, soluta laboriosam natus minus adipisci placeat esse magnam iusto! Nemo unde alias eaque illum eveniet error illo corrupti minus inventore. Harum sed velit nobis quidem natus illum, beatae ducimus.
            Ipsa quos eos aspernatur iure veritatis, nisi sunt asperiores labore provident. Soluta voluptatibus, quia quisquam doloremque sapiente nesciunt perferendis quae ipsum, cumque eos est consectetur quas quis a veniam temporibus.
            Eius vel voluptas natus ea suscipit, ipsa totam beatae debitis quibusdam dicta rerum unde at sequi itaque, iure quae. Itaque, nulla mollitia reiciendis voluptatem delectus iste optio aspernatur eaque eius?
            Magni illum quisquam, repudiandae quas beatae eius velit ullam obcaecati aperiam quaerat sapiente soluta quibusdam molestiae excepturi ratione veniam accusamus aut consequatur repellat, pariatur officia, perferendis vel. Maxime, soluta adipisci?
            Culpa officia sunt quos adipisci, accusamus quo est, debitis illum expedita deserunt odio quisquam velit quod nesciunt magnam ducimus excepturi possimus, dolore cupiditate amet vitae dolorum animi? Officiis, quasi iusto.
            Architecto nihil nam molestiae at odio ducimus quia voluptates recusandae temporibus, repellat perspiciatis nesciunt tempora repudiandae incidunt enim eos. Beatae perferendis harum quae expedita aliquid ab doloribus quos accusantium voluptate.
            Eum molestias nostrum quo non, at fuga animi quod. Corrupti suscipit aperiam illo sed repudiandae, veniam cupiditate ipsam veritatis dolor! Voluptatum pariatur sed molestias corrupti recusandae culpa omnis nisi nulla.
            Consectetur voluptates corrupti eaque beatae delectus aliquam nisi dignissimos excepturi corporis reiciendis mollitia necessitatibus quis explicabo ratione nostrum quia nulla asperiores earum magni dolor, impedit neque. Dolores numquam fugit dolorum.
            Veniam impedit doloremque aut ea possimus laborum cupiditate velit, id accusamus dicta enim iste quas non debitis maxime molestias eaque ab animi omnis quis? Iure recusandae rerum sint a inventore.
            Tenetur tempora veniam dolorum accusantium ut dolore facere unde voluptas quo architecto neque necessitatibus, fuga earum adipisci harum sed eius quia voluptate labore dolores officia. Culpa laboriosam qui veniam dicta.
            Autem vitae veniam doloribus dignissimos deleniti nemo voluptates odit. Nostrum neque reprehenderit voluptatem vero corporis quaerat voluptatum, aliquid cum sequi accusantium soluta quam repellendus. Ut veritatis aperiam eveniet voluptatum iure?
            Quam nobis dolorem id dicta, soluta dolorum nulla amet reiciendis illum corrupti provident vel libero consectetur! Laboriosam natus quia corporis veritatis cum, inventore dignissimos consectetur ex incidunt cumque quisquam beatae?
            Voluptatum tempore inventore id aliquam vel quam dolorum perferendis praesentium neque eveniet accusantium autem animi, dolore porro ad atque saepe magni assumenda ullam nam recusandae optio natus. Aliquid, sequi dolorum?
            Nesciunt maxime necessitatibus doloremque vitae corporis fugiat illum sunt ea natus odit nulla nemo praesentium incidunt placeat obcaecati similique, amet assumenda, exercitationem ut! Et aliquid expedita perspiciatis, soluta natus placeat?
            Provident quisquam, veritatis, illum assumenda voluptatem quo deserunt eligendi inventore expedita iste voluptate incidunt ducimus veniam rerum enim minima, mollitia repellendus soluta repellat. Soluta cupiditate, quis vel quasi aliquid vero?
            Atque beatae nesciunt facilis necessitatibus harum. Incidunt at non voluptates culpa aut reprehenderit fugiat optio dolorem veritatis. Quae voluptates reprehenderit quod reiciendis nam ex, quaerat perferendis eaque qui quibusdam? Ratione?
            Aut minima blanditiis ipsa, nobis quisquam, saepe commodi exercitationem iusto ab cumque sunt quasi odio similique quod reiciendis impedit nisi dolore accusantium debitis unde ut eaque dolorum magnam. Nisi, nam.
            Praesentium tenetur quae ipsa nulla maiores corporis nihil ad natus nesciunt sapiente laborum blanditiis iusto sed voluptas illo earum, saepe, ab cum dignissimos sequi minima sit reprehenderit fugit facilis. Eum.
            Veniam, assumenda nam! Optio, libero odit. Laudantium molestiae dolor rerum nihil eligendi odit cupiditate officia architecto pariatur ipsa quasi consequuntur adipisci nulla harum voluptates doloremque, similique temporibus dolorum ducimus sequi.
            Deserunt velit repellat nesciunt reiciendis qui esse eaque perferendis! Est blanditiis beatae voluptas omnis molestias hic exercitationem ab, magni pariatur ullam natus ipsum voluptate eos, at quas mollitia nam delectus.
            Voluptas neque iusto facilis laborum nobis labore, ullam eligendi consectetur maiores cupiditate dolorem similique eaque alias aspernatur quam eius magnam dignissimos nisi voluptatem odit error fugit nam ut! Expedita, sequi.
            Natus possimus, et minus asperiores laboriosam similique officiis nobis? Laudantium eveniet nihil fugiat tempore alias cum? Distinctio perspiciatis doloribus dolores porro, consequatur similique voluptas nesciunt provident natus? Dolorem, labore nobis?
            Quidem dolorem, a quos maxime et asperiores suscipit, facere, saepe vitae temporibus culpa. Provident repudiandae libero velit voluptates eligendi amet deserunt. Minus, velit in alias dolores accusantium laborum quasi sequi.
            Quod sapiente ullam assumenda maiores alias, maxime exercitationem ducimus, magni numquam illum, dolor itaque perferendis? Quasi praesentium sint molestias. A, ullam vero delectus alias dignissimos soluta ipsa molestiae consectetur velit.
            Voluptate repellendus eum quos modi corrupti quas assumenda fugiat. Illo rerum quo in autem. Cumque ea voluptate praesentium laudantium quisquam veniam debitis ex. Maxime eligendi, sapiente est cupiditate nam tempore!
            Nisi ab dolorem rerum facilis sunt sed optio perferendis perspiciatis fuga voluptates beatae ipsam dolores, culpa molestias fugit quos, quas quod voluptatum incidunt totam doloribus id. Modi in quibusdam ipsum.
            Maiores iure, molestias commodi praesentium rem qui nesciunt enim quidem architecto harum, dolore tempora consequatur? Iusto debitis sint odio consectetur tempore, incidunt repudiandae deleniti magnam hic expedita modi, labore cupiditate.
            Error, nesciunt eos. Pariatur id cumque quia illum consequatur eligendi repudiandae dolor dignissimos dicta quos quo nisi odit aut reiciendis dolores facere accusantium commodi atque, optio itaque maxime. Assumenda, distinctio.
            Commodi, hic rem alias a eaque amet aut repellat corrupti natus vitae nesciunt assumenda incidunt repellendus itaque cumque eius nemo dolore officiis ullam! Illum, libero maxime tempora deleniti excepturi ratione?
            Reprehenderit voluptatum iure aperiam? Blanditiis omnis dolores repellat harum quae tempore quisquam accusamus in, facilis cumque, officiis nihil modi. Asperiores eum sunt expedita laboriosam assumenda enim ullam nobis quia recusandae.
            Quisquam neque voluptas, quis minima voluptates veniam atque ex molestiae qui? Quam, sequi, vitae modi ipsam delectus accusamus dolorum non eum quod voluptate, officiis praesentium in? Pariatur voluptas nulla consectetur!
            At tempore tempora nesciunt molestiae accusantium dignissimos quidem architecto, eligendi neque sint saepe esse accusamus repellendus, mollitia nemo expedita! Reprehenderit minus voluptatibus molestiae dignissimos natus repellat corporis ut officiis placeat.
            Adipisci consequuntur qui sequi fugit libero, omnis atque earum doloremque esse placeat quasi architecto sit voluptatem deserunt expedita dicta, natus, praesentium facilis soluta sapiente porro iste delectus quae beatae. Magni.
            Odit minima sed eos beatae necessitatibus delectus minus distinctio, sequi ratione at sit corporis temporibus laborum obcaecati ullam. Perferendis at, enim quod incidunt suscipit quae. Incidunt facilis qui nesciunt repudiandae.
          </div>
        </Parallax>
      </div>
    </div>
  );
};

export default Home;
