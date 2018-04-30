import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JTextArea;
import javax.swing.JComboBox;
import javax.swing.ButtonGroup;
import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JTextField;
import java.awt.Button;
import java.awt.Label;
import javax.swing.JCheckBox;
import javax.swing.JRadioButton;
import java.awt.event.ActionListener;
import java.sql.*;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JToggleButton;
import javax.swing.JButton;
import java.awt.Color;
import java.awt.Component;

import javax.swing.SwingConstants;
import java.awt.SystemColor;
import javax.swing.UIManager;
import java.awt.Font;
public class MainDB {

	private JFrame frame;
	private JTextField tfSearch;
	private JTextField tfSTD_ID;
	private JTextField tfName;
	private JTextField tfSurname;
	private JTextField tfHeight;
	private JTextField tfWeight;

	//--------------------------------Special variable-------------------------
	Connection conn;
	String qry = null;
	Statement stment = null ;
	ResultSet rs = null;
	int Rowsize;
	protected Component frmLabwdb;
	protected String STD_ID;
	protected String GenderA;
	protected String SectionA;
	//-----------------------------End variable--------------------------------
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainDB window = new MainDB();
					window.frame.setVisible(true);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public MainDB() {
		initialize();
				 
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		//-------------------------------------------connect database ------------------------------------------
		try
		{
			conn = DriverManager.getConnection("jdbc:ucanaccess://D:\\ASX\\OOP\\LAB12\\DB\\Database1.mdb", "", "");
			stment = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		} catch (SQLException e2)
		{
			e2.printStackTrace();
		}
		//------------------------------------------End connect databast----------------------------------------

		frame = new JFrame();
		frame.setBounds(100, 100, 508, 578);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JComboBox cbOption = new JComboBox();
		cbOption.setFont(new Font("Tahoma", Font.PLAIN, 16));
		cbOption.setModel(new DefaultComboBoxModel(new String[] {"\u0E17\u0E31\u0E49\u0E07\u0E2B\u0E21\u0E14", "\u0E23\u0E2B\u0E31\u0E2A\u0E19\u0E28", "\u0E0A\u0E37\u0E48\u0E2D"}));
		cbOption.setBounds(10, 23, 89, 20);
		frame.getContentPane().add(cbOption);
		
		tfSearch = new JTextField();
		tfSearch.setFont(new Font("Tahoma", Font.PLAIN, 15));
		tfSearch.setBounds(122, 25, 128, 20);
		frame.getContentPane().add(tfSearch);
		tfSearch.setColumns(10);
		
		Label id_label = new Label("\u0E23\u0E2B\u0E31\u0E2A\u0E19\u0E31\u0E01\u0E28\u0E36\u0E01\u0E29\u0E32");
		id_label.setFont(new Font("Dialog", Font.PLAIN, 16));
		id_label.setBounds(10, 74, 89, 22);
		frame.getContentPane().add(id_label);
		
		tfSTD_ID = new JTextField();
		tfSTD_ID.setFont(new Font("Tahoma", Font.PLAIN, 15));
		tfSTD_ID.setBounds(122, 74, 128, 20);
		frame.getContentPane().add(tfSTD_ID);
		tfSTD_ID.setColumns(10);
		
		Label label_1 = new Label("\u0E0A\u0E37\u0E48\u0E2D");
		label_1.setFont(new Font("Dialog", Font.PLAIN, 16));
		label_1.setBounds(10, 120, 62, 22);
		frame.getContentPane().add(label_1);
		
		Label label_2 = new Label("\u0E19\u0E32\u0E21\u0E2A\u0E01\u0E38\u0E25");
		label_2.setFont(new Font("Dialog", Font.PLAIN, 16));
		label_2.setBounds(10, 165, 62, 22);
		frame.getContentPane().add(label_2);
		
		JComboBox cbGender = new JComboBox();
		cbGender.setFont(new Font("Tahoma", Font.PLAIN, 16));
		cbGender.setModel(new DefaultComboBoxModel(new String[] {"\u0E0A\u0E32\u0E22", "\u0E2B\u0E0D\u0E34\u0E07"}));
		cbGender.setBounds(122, 211, 109, 22);
		frame.getContentPane().add(cbGender);
		
		Label label_3 = new Label("\u0E40\u0E1E\u0E28");
		label_3.setFont(new Font("Dialog", Font.PLAIN, 16));
		label_3.setBounds(10, 211, 62, 22);
		frame.getContentPane().add(label_3);
		
		JCheckBox chkTemple = new JCheckBox("\u0E40\u0E02\u0E49\u0E32\u0E23\u0E48\u0E27\u0E21\u0E42\u0E04\u0E23\u0E07\u0E01\u0E32\u0E23\u0E04\u0E38\u0E13\u0E18\u0E23\u0E23\u0E21\u0E08\u0E23\u0E34\u0E22\u0E18\u0E23\u0E23\u0E21\u0E41\u0E25\u0E49\u0E27");
		chkTemple.setFont(new Font("Tahoma", Font.PLAIN, 16));
		chkTemple.setBounds(69, 255, 250, 23);
		frame.getContentPane().add(chkTemple);
		
		
		JRadioButton rdButton1 = new JRadioButton("\u0E20\u0E32\u0E04\u0E1B\u0E01\u0E15\u0E34");
		rdButton1.setFont(new Font("Tahoma", Font.PLAIN, 16));
		rdButton1.setBounds(69, 296, 109, 23);
		frame.getContentPane().add(rdButton1);
		
		JRadioButton rdButton2 = new JRadioButton("\u0E42\u0E04\u0E23\u0E07\u0E01\u0E32\u0E23\u0E1E\u0E34\u0E40\u0E28\u0E29");
		rdButton2.setFont(new Font("Tahoma", Font.PLAIN, 16));
		rdButton2.setBounds(180, 296, 144, 23);
		frame.getContentPane().add(rdButton2);

        //----------------------------------set group radio button -------------------------
		rdButton1.setActionCommand("Normal");
		rdButton2.setActionCommand("VIP");
		final ButtonGroup group = new ButtonGroup();
		group.add(rdButton1);
		group.add(rdButton2);
		
		//cbGender.getSelectedItem().toString()
		//group.getSelection().getActionCommand());
		//----------------------------------------end set group-----------------------------
		
		tfName = new JTextField();
		tfName.setFont(new Font("Tahoma", Font.PLAIN, 15));
		tfName.setBounds(122, 122, 128, 20);
		frame.getContentPane().add(tfName);
		tfName.setColumns(10);
		
		tfSurname = new JTextField();
		tfSurname.setFont(new Font("Tahoma", Font.PLAIN, 15));
		tfSurname.setBounds(122, 167, 128, 20);
		frame.getContentPane().add(tfSurname);
		tfSurname.setColumns(10);
		
		JLabel page = new JLabel("");
		page.setBounds(182, 339, 46, 14);
		frame.getContentPane().add(page);
		
		JButton btSearch = new JButton("");
		btSearch.setForeground(Color.WHITE);
		btSearch.setBackground(UIManager.getColor("Button.background"));
		
		JLabel lbDBBar = new JLabel("/");
		lbDBBar.setBounds(156, 403, 46, 14);
		frame.getContentPane().add(lbDBBar);
		
		tfHeight = new JTextField();
		tfHeight.setFont(new Font("Tahoma", Font.PLAIN, 15));
		tfHeight.setBounds(122, 334, 86, 20);
		frame.getContentPane().add(tfHeight);
		tfHeight.setColumns(10);
		
		tfWeight = new JTextField();
		tfWeight.setFont(new Font("Tahoma", Font.PLAIN, 15));
		tfWeight.setColumns(10);
		tfWeight.setBounds(122, 372, 86, 20);
		frame.getContentPane().add(tfWeight);
		
		btSearch.addActionListener(new ActionListener() {	
			public void actionPerformed(ActionEvent arg0) {
				try {
					 switch (cbOption.getSelectedIndex()) 
					 {
						case 0:
						qry = "SELECT * FROM student";
						break;
						case 1:
						qry = "SELECT * FROM student where STD_ID = '" +
						tfSearch.getText() + "'";
						break;
						case 2:
						qry = "SELECT * FROM student where Name = '" +
						tfSearch.getText() + "'";
						break;
					 }
						rs = stment.executeQuery(qry);
					   //------------------------fine maximum value---------------------
						if (rs.last()) {
							  Rowsize = rs.getRow();
					          rs.beforeFirst(); 
					    }
						//---------------------------end------------------------------
						
						if (rs.next()) {
							tfSTD_ID.setText(rs.getString("STD_ID"));
							tfName.setText(rs.getString("Name"));
							tfSurname.setText(rs.getString("Surname"));
							chkTemple.setSelected(rs.getBoolean("Temple"));
							if (rs.getString("Gender").equals("Male")) 
							{
								cbGender.setSelectedIndex(0);
							} else
							{
								cbGender.setSelectedIndex(1);
							}
							if (rs.getString("Section").equals("Normal"))
							{
								rdButton1.setSelected(true);
							} 
							else 
							{
								rdButton2.setSelected(true);
							}
							tfHeight.setText(rs.getString("Height"));
							tfWeight.setText(rs.getString("Weight"));	
						}						
						lbDBBar.setText(Integer.toString(rs.getRow()) + "/" + Integer.toString(Rowsize));
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				
				
			}
		});
		btSearch.setBounds(260, 11, 87, 77);
		frame.getContentPane().add(btSearch); 
		btSearch.setIcon(new ImageIcon(((new ImageIcon("D:\\ASX\\OOP\\LAB12\\icon\\search-icon.png")).getImage()).getScaledInstance(btSearch.getWidth(), btSearch.getHeight(),java.awt.Image.SCALE_AREA_AVERAGING)));
		
		JButton btFirst = new JButton("|<");
		btFirst.setFont(new Font("Tahoma", Font.BOLD, 16));
		btFirst.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					if (rs.first()) {
						tfSTD_ID.setText(rs.getString("STD_ID"));
						tfName.setText(rs.getString("Name"));
						tfSurname.setText(rs.getString("Surname"));
						chkTemple.setSelected(rs.getBoolean("Temple"));
						if (rs.getString("Gender").equals("Male"))
						{
							cbGender.setSelectedIndex(0);
						} 
						else
						{
							cbGender.setSelectedIndex(1);
						}
						if (rs.getString("Section").equals("Normal"))
						{
							rdButton1.setSelected(true);
						} 
						else 
						{
							rdButton2.setSelected(true);
						}
						tfSTD_ID.setText(rs.getString("STD_ID"));
						tfName.setText(rs.getString("Name"));
						tfSurname.setText(rs.getString("Surname"));
						chkTemple.setSelected(rs.getBoolean("Temple"));
						if (rs.getString("Gender").equals("Male"))
						{
							cbGender.setSelectedIndex(0);
						} 
						else 
						{
							cbGender.setSelectedIndex(1);
						}
						if (rs.getString("Section").equals("Normal"))
						{
							rdButton1.setSelected(true);
						} 
						else 
						{
							rdButton2.setSelected(true);
						}
						tfHeight.setText(rs.getString("Height"));
						tfWeight.setText(rs.getString("Weight"));
						}
					
				    
					lbDBBar.setText(Integer.toString(rs.getRow()) + "/" + Integer.toString(Rowsize));
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		btFirst.setBounds(10, 399, 62, 23);
		frame.getContentPane().add(btFirst);
		
		JButton btPrevious = new JButton("<");
		btPrevious.setFont(new Font("Tahoma", Font.BOLD, 16));
		btPrevious.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					if (rs.previous()) {
						tfSTD_ID.setText(rs.getString("STD_ID"));
						tfName.setText(rs.getString("Name"));
						tfSurname.setText(rs.getString("Surname"));
						chkTemple.setSelected(rs.getBoolean("Temple"));
						if (rs.getString("Gender").equals("Male"))
						{
							cbGender.setSelectedIndex(0);
						} 
						else
						{
							cbGender.setSelectedIndex(1);
						}
						if (rs.getString("Section").equals("Normal"))
						{
							rdButton1.setSelected(true);
						} 
						else 
						{
							rdButton2.setSelected(true);
						}
						tfSTD_ID.setText(rs.getString("STD_ID"));
						tfName.setText(rs.getString("Name"));
						tfSurname.setText(rs.getString("Surname"));
						chkTemple.setSelected(rs.getBoolean("Temple"));
						if (rs.getString("Gender").equals("Male"))
						{
							cbGender.setSelectedIndex(0);
						} 
						else 
						{
							cbGender.setSelectedIndex(1);
						}
						if (rs.getString("Section").equals("Normal"))
						{
							rdButton1.setSelected(true);
						} 
						else 
						{
							rdButton2.setSelected(true);
						}
						tfHeight.setText(rs.getString("Height"));
						tfWeight.setText(rs.getString("Weight"));
						}				
				    
					lbDBBar.setText(Integer.toString(rs.getRow()) + "/" + Integer.toString(Rowsize));
				} catch (SQLException e1) {
					
					e1.printStackTrace();
				}
			}
		});
		btPrevious.setBounds(84, 399, 52, 23);
		frame.getContentPane().add(btPrevious);
		
		JButton btNext = new JButton(">");
		btNext.setFont(new Font("Tahoma", Font.BOLD, 16));
		btNext.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					if (rs.next()) {
						tfSTD_ID.setText(rs.getString("STD_ID"));
						tfName.setText(rs.getString("Name"));
						tfSurname.setText(rs.getString("Surname"));
						chkTemple.setSelected(rs.getBoolean("Temple"));
						if (rs.getString("Gender").equals("Male"))
						{
							cbGender.setSelectedIndex(0);
						} 
						else
						{
							cbGender.setSelectedIndex(1);
						}
						if (rs.getString("Section").equals("Normal"))
						{
							rdButton1.setSelected(true);
						} 
						else 
						{
							rdButton2.setSelected(true);
						}
						tfSTD_ID.setText(rs.getString("STD_ID"));
						tfName.setText(rs.getString("Name"));
						tfSurname.setText(rs.getString("Surname"));
						chkTemple.setSelected(rs.getBoolean("Temple"));
						if (rs.getString("Gender").equals("Male"))
						{
							cbGender.setSelectedIndex(0);
						} 
						else 
						{
							cbGender.setSelectedIndex(1);
						}
						if (rs.getString("Section").equals("Normal"))
						{
							rdButton1.setSelected(true);
						} 
						else 
						{
							rdButton2.setSelected(true);
						}
						tfHeight.setText(rs.getString("Height"));
						tfWeight.setText(rs.getString("Weight"));
						}
					
			
					lbDBBar.setText(Integer.toString(rs.getRow()) + "/" + Integer.toString(Rowsize));
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		btNext.setBounds(212, 399, 52, 23);
		frame.getContentPane().add(btNext);
		
		JButton btLast = new JButton(">|");
		btLast.setFont(new Font("Tahoma", Font.BOLD, 16));
		btLast.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					if (rs.last()) {
						tfSTD_ID.setText(rs.getString("STD_ID"));
						tfName.setText(rs.getString("Name"));
						tfSurname.setText(rs.getString("Surname"));
						chkTemple.setSelected(rs.getBoolean("Temple"));
						if (rs.getString("Gender").equals("Male"))
						{
							cbGender.setSelectedIndex(0);
						} 
						else
						{
							cbGender.setSelectedIndex(1);
						}
						if (rs.getString("Section").equals("Normal"))
						{
							rdButton1.setSelected(true);
						} 
						else 
						{
							rdButton2.setSelected(true);
						}
						tfSTD_ID.setText(rs.getString("STD_ID"));
						tfName.setText(rs.getString("Name"));
						tfSurname.setText(rs.getString("Surname"));
						chkTemple.setSelected(rs.getBoolean("Temple"));
						if (rs.getString("Gender").equals("Male"))
						{
							cbGender.setSelectedIndex(0);
						} 
						else 
						{
							cbGender.setSelectedIndex(1);
						}
						if (rs.getString("Section").equals("Normal"))
						{
							rdButton1.setSelected(true);
						} 
						else 
						{
							rdButton2.setSelected(true);
						}
						tfHeight.setText(rs.getString("Height"));
						tfWeight.setText(rs.getString("Weight"));
						}
					
				    
					lbDBBar.setText(Integer.toString(rs.getRow()) + "/" + Integer.toString(Rowsize));
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		btLast.setBounds(280, 399, 67, 23);
		frame.getContentPane().add(btLast);
		
		
		
		Label label = new Label("\u0E2A\u0E48\u0E27\u0E19\u0E2A\u0E39\u0E07");
		label.setFont(new Font("Dialog", Font.PLAIN, 16));
		label.setBounds(10, 332, 62, 22);
		frame.getContentPane().add(label);
		
		Label label_4 = new Label("\u0E19\u0E49\u0E33\u0E2B\u0E19\u0E31\u0E01");
		label_4.setFont(new Font("Dialog", Font.PLAIN, 16));
		label_4.setBounds(10, 370, 62, 22);
		frame.getContentPane().add(label_4);
		
		JButton btAdd = new JButton("");
		btAdd.setBackground(UIManager.getColor("Button.background"));
		btAdd.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				 String tmp = "";
				 if (chkTemple.isSelected())
				 { tmp = "1"; }
				 else
				 {tmp = "0"; }
				 String qry = "INSERT INTO student(STD_ID,Name,Surname,Gender,Temple,Section,Height,Weight) VALUES ('"+ tfSTD_ID.getText() + "','" + tfName.getText() + "','" + tfSurname.getText() + "','"+cbGender.getSelectedItem().toString() + "'," + tmp + ",'" + group.getSelection().getActionCommand() + "',"+ tfHeight.getText()+ "," + tfWeight.getText() + ");";
				 	System.out.print(qry);
				 try {
					 stment.executeUpdate(qry);
					 JOptionPane.showMessageDialog(tfSTD_ID, "ได้ทำกาบันทึกเรียบร้อย","แจ้งเตือนเรียบร้อย", 3);
				 } catch (SQLException e)
				 {
					 e.printStackTrace(); 
				 }
			}
		});
		btAdd.setBounds(373, 43, 89, 74);
		frame.getContentPane().add(btAdd);
		btAdd.setIcon(new ImageIcon(((new ImageIcon("D:\\ASX\\OOP\\LAB12\\icon\\add-icon.png")).getImage()).getScaledInstance(btSearch.getWidth(), btSearch.getHeight(),java.awt.Image.SCALE_AREA_AVERAGING)));
		
		JButton btEdit = new JButton("");
		btEdit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String qry = "UPDATE student SET Name = '" + tfName.getText() + "',Surname = '"
						+ tfSurname.getText() + "',Gender= '" + cbGender.getSelectedItem().toString() + "',Temple= '" + chkTemple.isSelected()
						+ "',Section= '" + group.getSelection().getActionCommand() + "',Height =" + tfHeight.getText() + ",Weight="
						+ tfWeight.getText() + " where STD_ID = '" + tfSTD_ID.getText() + "'";
				try {
					stment.executeUpdate(qry);
					JOptionPane.showMessageDialog(tfSTD_ID,"ได้รับการแก้ไขแล้ว","แจ้งเตือน",3);
					} catch (SQLException e1) {
					e1.printStackTrace();
					}
			}
			
			
		});
		btEdit.setBounds(373, 128, 89, 85);
		frame.getContentPane().add(btEdit);
		btEdit.setIcon(new ImageIcon(((new ImageIcon("D:\\ASX\\OOP\\LAB12\\icon\\edit-icon.png")).getImage()).getScaledInstance(btSearch.getWidth(), btSearch.getHeight(),java.awt.Image.SCALE_AREA_AVERAGING)));
		
		JButton btDelete = new JButton("");
		btDelete.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if (JOptionPane.showConfirmDialog(frmLabwdb, "คุณตอ้ งการลบขอ้ มูล " + tfSTD_ID.getText()
				+ " หรือไม่?",
				"ยืนยัน", JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION)
				{
				String qry = "DELETE FROM student where STD_ID ='" + tfSTD_ID.getText() + "'";
				try {
				stment.executeUpdate(qry);
				btSearch.doClick();
				} catch (SQLException e) {
				e.printStackTrace();
				}
				}
			}
		});
		btDelete.setBounds(373, 224, 89, 77);
		frame.getContentPane().add(btDelete);
		btDelete.setIcon(new ImageIcon(((new ImageIcon("D:\\ASX\\OOP\\LAB12\\icon\\remove-icon.png")).getImage()).getScaledInstance(btSearch.getWidth(), btSearch.getHeight(),java.awt.Image.SCALE_AREA_AVERAGING)));
		
		JButton btOK = new JButton("");
		btOK.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
			}
		});
		btOK.setBounds(156, 451, 89, 77);
		frame.getContentPane().add(btOK);
		btOK.setIcon(new ImageIcon(((new ImageIcon("D:\\ASX\\OOP\\LAB12\\icon\\ok-icon.png")).getImage()).getScaledInstance(btSearch.getWidth(), btSearch.getHeight(),java.awt.Image.SCALE_AREA_AVERAGING)));
		
		JButton btCancel = new JButton("");
		btCancel.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btCancel.setBounds(260, 451, 89, 77);
		frame.getContentPane().add(btCancel);
		btCancel.setIcon(new ImageIcon(((new ImageIcon("D:\\ASX\\OOP\\LAB12\\icon\\close-icon.png")).getImage()).getScaledInstance(btSearch.getWidth(), btSearch.getHeight(),java.awt.Image.SCALE_AREA_AVERAGING)));
			
	
	}
}
