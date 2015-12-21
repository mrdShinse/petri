Post.create!(
  title:            'PlayFrameworkでModelからセッション情報を取得する方法はありますか？',
  content:
    'PlayFramework 2.2 with Javaを使ってアプリを作っています。

    Modelの保存時に、追跡情報としてcreate_user_id/update_user_idを保存したいのですが、
    PlayFrameworkのModelからセッション情報を取り出せません。

    現在は、保存時にControllerから毎回セッションから取り出したUserのエンティティを渡しているのですが、ひどい実装なので、
    Model.save()メソッドを呼び出したときに、Model側でセッションからログインユーザーを取得して
    保存してくれるような実装にしたいです。

    何か、ベストプラクティスをご存知の方がいらっしゃいましたらご教授頂けませんか。

    public abstract class AbstractTrailModel extends Model {

      public static final int INSERT = 1;
      public static final int UPDATE = 2;
      public static final int DELETE = 3;

      @ManyToOne(cascade = CascadeType.ALL)
      @Constraints.Required
      public User createUser;

      @ManyToOne(cascade = CascadeType.ALL)
      @Constraints.Required
      public User createUser;

      @Constraints.Required
      public Integer is_delete;


      public void save(User loginUser){

        if(create_time != null){
          setTrailInfo(UPDATE, loginUser);
          super.save();

        }else{
          setTrailInfo(INSERT, loginUser);
          super.save();
        }
      }


      public void setTrailInfo(int code, User loginUser){

        switch(code) {
          case INSERT:
            createUser = loginUser;
          case UPDATE:
          case DELETE:
            updateUser = loginUser;
        }

        if(code == DELETE){
          is_delete = 1;

        }else{
          is_delete = 0;
        }
      }
    }',
  user_id:          1
)
Post.create!(
  title:            'Netbeansで依存しているプロジェクトのソースを確認したい。',
  content:
    'タイトルの通りです。
    ご存知の方教えてください。

    Netbeansは8.0を使っています。

    追記
    今回の目的は、Netbeansの「宣言へ移動」機能を使用した際に、ソースが読めること。
    また、UMLでグラフィカルにクラス図を見ることもできるならば、その方法を教えてください。

    現在、JavaEEでWebシステムを作っており、
    依存性はいずれもMavenで管理しています。

    POM.xml

    <dependencies>
        <dependency>
            <groupId>javax</groupId>
            <artifactId>javaee-web-api</artifactId>
            <version>7.0</version>
            <scope>provided</scope>
        </dependency>
        <dependency>
            <groupId>org.primefaces</groupId>
            <artifactId>primefaces</artifactId>
            <version>5.2</version>
        </dependency>
        <dependency>
            <groupId>org.apache.logging.log4j</groupId>
            <artifactId>log4j-web</artifactId>
            <version>2.3</version>
            <scope>runtime</scope>
        </dependency>
    </dependencies>',
  user_id:          1
)

Answer.create!(
  content: 'Playのセッションを取り出す件については、play.mvc.Http.Context.current().session()を呼び出すと、play.mvc.Http.Sessionオブジェクトを取得できます。',
  user_id: 2,
  post_id: 1
)

Answer.create!(
  content:
    'mavenで依存しているライブラリのソースを参照したいという話であれば、ソースを参照したいjarを右クリックして「ソースをダウンロード」を選択すればOKです。
    なおNetBeansプロジェクト自体がmavenプロジェクトとなっていることが前提です。

    mavenプロジェクト例

    依存するライブラリのソースをまとめてダウンロードしたい場合は「依存性」を右クリックしてから開くメニューからでも可能です。

    ソースのダウンロードが完了すればclassファイルのダブルクリックでソースを参照できます。もちろんユーザが開発しているソースから「宣言へ移動」でもジャンプできます。

    ソースの参照例

    なおライブラリの依存関係についてはUMLとはちょっと違いますが、「アーティファクトの詳細表示」→「グラフ」タブ→「グラフの表示」という手順で図示可能です。',
  user_id: 2,
  post_id: 2
)
